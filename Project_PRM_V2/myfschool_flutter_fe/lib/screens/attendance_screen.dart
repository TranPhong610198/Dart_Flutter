import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/attendance_model.dart';
import '../controller/attendance_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'notification_list_screen.dart';

class AttendanceScreen extends StatefulWidget {
  final UserModel user;

  const AttendanceScreen({super.key, required this.user});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final AttendanceApiController _attendanceController = AttendanceApiController();

  List<AttendanceModel> _records = [];
  bool _isLoading = true;

  // Month/year filter — default to current month
  late int _selectedYear;
  late int _selectedMonth;

  final List<String> _monthLabels = [
    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
    'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8',
    'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedYear = now.year;
    _selectedMonth = now.month;
    _loadAttendance();
  }

  Future<void> _loadAttendance() async {
    setState(() => _isLoading = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final studentIdStr = prefs.getString('selectedChildId');
      final int studentId = (studentIdStr != null && studentIdStr.isNotEmpty)
          ? int.tryParse(studentIdStr) ?? widget.user.id
          : widget.user.id;

      final data = await _attendanceController.getAttendance(
        widget.user.accessToken,
        studentId,
        year: _selectedYear,
        month: _selectedMonth,
      );
      if (mounted) {
        setState(() {
          _records = data;
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

  // --- Counts ---
  int get _presentCount =>
      _records.where((r) => r.status == 'PRESENT').length;
  int get _absentPermCount =>
      _records.where((r) => r.status == 'ABSENT_WITH_PERMISSION').length;
  int get _absentNoPermCount =>
      _records.where((r) => r.status == 'ABSENT_WITHOUT_PERMISSION').length;

  // Status helpers
  Color _statusColor(String status) {
    switch (status) {
      case 'PRESENT':
        return Colors.green.shade600;
      case 'ABSENT_WITH_PERMISSION':
        return Colors.orange.shade700;
      case 'ABSENT_WITHOUT_PERMISSION':
        return Colors.red.shade600;
      default:
        return Colors.grey;
    }
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'PRESENT':
        return 'Có mặt';
      case 'ABSENT_WITH_PERMISSION':
        return 'Vắng có phép';
      case 'ABSENT_WITHOUT_PERMISSION':
        return 'Vắng không phép';
      default:
        return status;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'PRESENT':
        return Icons.check_circle_outline;
      case 'ABSENT_WITH_PERMISSION':
        return Icons.info_outline;
      case 'ABSENT_WITHOUT_PERMISSION':
        return Icons.cancel_outlined;
      default:
        return Icons.help_outline;
    }
  }

  /// Format "2026-03-13" → "13/03/2026"
  String _formatDate(String raw) {
    try {
      final parts = raw.split('-');
      return '${parts[2]}/${parts[1]}/${parts[0]}';
    } catch (_) {
      return raw;
    }
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

  @override
  Widget build(BuildContext context) {
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
                      'Điểm danh',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // --- Month / Year filter ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Month dropdown
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: _selectedMonth,
                          isExpanded: true,
                          items: List.generate(12, (i) => DropdownMenuItem(
                            value: i + 1,
                            child: Text(_monthLabels[i],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          )),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => _selectedMonth = val);
                              _loadAttendance();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Year dropdown
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: _selectedYear,
                          isExpanded: true,
                          items: [2025, 2026].map((y) => DropdownMenuItem(
                            value: y,
                            child: Text('$y',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          )).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => _selectedYear = val);
                              _loadAttendance();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // --- Summary Row ---
            if (!_isLoading && _records.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _summaryChip('Có mặt', _presentCount, Colors.green.shade600),
                    const SizedBox(width: 8),
                    _summaryChip('Có phép', _absentPermCount, Colors.orange.shade700),
                    const SizedBox(width: 8),
                    _summaryChip('Không phép', _absentNoPermCount, Colors.red.shade600),
                  ],
                ),
              ),

            const SizedBox(height: 12),

            // --- Records List ---
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                  : _records.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.event_available,
                                  size: 64, color: Colors.orange.shade200),
                              const SizedBox(height: 12),
                              const Text('Không có dữ liệu điểm danh',
                                  style: TextStyle(color: Colors.grey, fontSize: 16)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _records.length,
                          itemBuilder: (context, index) {
                            final record = _records[index];
                            final color = _statusColor(record.status);
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.06),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // Status icon
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.12),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(_statusIcon(record.status),
                                        color: color, size: 24),
                                  ),
                                  const SizedBox(width: 14),
                                  // Date
                                  Expanded(
                                    child: Text(
                                      _formatDate(record.date),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 15),
                                    ),
                                  ),
                                  // Status badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      _statusLabel(record.status),
                                      style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
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

  Widget _summaryChip(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            Text(label,
                style: TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w600, color: color)),
          ],
        ),
      ),
    );
  }
}
