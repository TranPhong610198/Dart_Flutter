import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/timetable_model.dart';
import '../controller/timetable_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'notification_list_screen.dart';

class TimetableScreen extends StatefulWidget {
  final UserModel user;

  const TimetableScreen({super.key, required this.user});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final TimetableController _timetableController = TimetableController();
  List<TimetableModel> _timetable = [];
  bool _isLoading = true;
  int _selectedDayIndex = 0; // 0=Mon, 1=Tue, ...

  final List<String> _dayLabels = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7'];
  final List<int> _weekdays = [1, 2, 3, 4, 5, 6]; // DateTime weekday values (Mon=1)

  @override
  void initState() {
    super.initState();
    // Default selected day to today if it's a weekday
    final todayWeekday = DateTime.now().weekday;
    final found = _weekdays.indexOf(todayWeekday);
    if (found >= 0) _selectedDayIndex = found;
    _loadTimetable();
  }

  Future<void> _loadTimetable() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final studentIdStr = prefs.getString('selectedChildId');
      // For non-parent (child/teacher) use their own id
      final int studentId = (studentIdStr != null && studentIdStr.isNotEmpty)
          ? int.tryParse(studentIdStr) ?? widget.user.id
          : widget.user.id;

      final data = await _timetableController.getTimetableByStudent(
          widget.user.accessToken, studentId);
      if (mounted) {
        setState(() {
          _timetable = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      }
    }
  }

  /// Filter entries that match the selected weekday
  List<TimetableModel> get _filteredEntries {
    final targetWeekday = _weekdays[_selectedDayIndex];
    return _timetable.where((t) {
      if (t.classTime.isEmpty) return false;
      try {
        final dt = DateTime.parse(t.classTime);
        return dt.weekday == targetWeekday;
      } catch (_) {
        return false;
      }
    }).toList();
  }

  void _onNavTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: widget.user)));
    } else if (index == 1) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => NotificationListScreen(user: widget.user)));
    }
  }

  /// Format "2026-03-16T07:00:00" → "07:00"
  String _formatTime(String raw) {
    try {
      final dt = DateTime.parse(raw);
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return raw;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredEntries;

    return Scaffold(
      backgroundColor: const Color(0xFFFDECDA),
      body: SafeArea(
        child: Column(
          children: [
            // --- Header ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepOrange),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Thời khóa biểu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // balance the back button
                ],
              ),
            ),

            // --- Day Selector Tabs ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_dayLabels.length, (index) {
                  final isSelected = index == _selectedDayIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedDayIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _dayLabels[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: isSelected ? Colors.white : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 14),

            // --- Timetable List ---
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                  : filtered.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.event_busy, size: 64, color: Colors.orange.shade200),
                              const SizedBox(height: 12),
                              const Text(
                                'Không có tiết học hôm nay',
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            final time = _formatTime(item.classTime);
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.07),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    // Orange time sidebar
                                    Container(
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          time,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Content
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.subject,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                const Icon(Icons.room, size: 16, color: Colors.orange),
                                                const SizedBox(width: 4),
                                                Text(
                                                  item.room,
                                                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // Lesson number badge
                                    Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade50,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: _onNavTap,
      ),
    );
  }
}
