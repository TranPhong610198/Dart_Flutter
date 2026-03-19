import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/grade_model.dart';
import '../controller/grade_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'notification_list_screen.dart';

class GradesScreen extends StatefulWidget {
  final UserModel user;

  const GradesScreen({super.key, required this.user});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  final GradeController _gradeController = GradeController();
  List<GradeModel> _grades = [];
  bool _isLoading = true;

  // Filter values
  String _selectedSemester = 'HK1';
  String _selectedYear = '2024-2025';

  final List<String> _semesters = ['HK1', 'HK2'];
  final List<String> _years = ['2024-2025', '2023-2024'];

  @override
  void initState() {
    super.initState();
    _loadGrades();
  }

  Future<void> _loadGrades() async {
    setState(() => _isLoading = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final studentIdStr = prefs.getString('selectedChildId');
      final int studentId = (studentIdStr != null && studentIdStr.isNotEmpty)
          ? int.tryParse(studentIdStr) ?? widget.user.id
          : widget.user.id;

      final data = await _gradeController.getGrades(
        widget.user.accessToken,
        studentId,
        semester: _selectedSemester,
        year: _selectedYear,
      );
      if (mounted) {
        setState(() {
          _grades = data;
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

  /// Average score of all displayed grades
  double get _average {
    if (_grades.isEmpty) return 0;
    return _grades.fold(0.0, (sum, g) => sum + g.score) / _grades.length;
  }

  /// Color-code score: green ≥ 8, orange ≥ 5, red < 5
  Color _scoreColor(double score) {
    if (score >= 8.0) return Colors.green.shade600;
    if (score >= 5.0) return Colors.orange.shade700;
    return Colors.red.shade600;
  }

  /// Xếp loại based on average: Giỏi ≥ 8, Khá ≥ 6.5, TB ≥ 5, Yếu < 5
  String _rankLabel(double avg) {
    if (avg >= 8.0) return 'Giỏi';
    if (avg >= 6.5) return 'Khá';
    if (avg >= 5.0) return 'Trung bình';
    return 'Yếu';
  }

  Color _rankColor(double avg) {
    if (avg >= 8.0) return Colors.green.shade600;
    if (avg >= 6.5) return Colors.orange.shade700;
    if (avg >= 5.0) return Colors.blue.shade600;
    return Colors.red.shade600;
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
    final avg = _average;

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
                      'Bảng điểm',
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

            // --- Filter Row ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Semester dropdown
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedSemester,
                          items: _semesters.map((s) => DropdownMenuItem(
                            value: s,
                            child: Text(s, style: const TextStyle(fontWeight: FontWeight.bold)),
                          )).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => _selectedSemester = val);
                              _loadGrades();
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
                        child: DropdownButton<String>(
                          value: _selectedYear,
                          items: _years.map((y) => DropdownMenuItem(
                            value: y,
                            child: Text(y, style: const TextStyle(fontWeight: FontWeight.bold)),
                          )).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => _selectedYear = val);
                              _loadGrades();
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

            // --- Summary Card ---
            if (!_isLoading && _grades.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Điểm trung bình', style: TextStyle(color: Colors.white70, fontSize: 13)),
                            Text(
                              avg.toStringAsFixed(1),
                              style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Xếp loại', style: TextStyle(color: Colors.white70, fontSize: 13)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _rankLabel(avg),
                              style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('${_grades.length} môn học',
                              style: const TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 12),

            // --- Grades List ---
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                  : _grades.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.grade_outlined, size: 64, color: Colors.orange.shade200),
                              const SizedBox(height: 12),
                              const Text('Không có dữ liệu điểm',
                                  style: TextStyle(color: Colors.grey, fontSize: 16)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _grades.length,
                          itemBuilder: (context, index) {
                            final grade = _grades[index];
                            final color = _scoreColor(grade.score);
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                                  // Subject icon
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.12),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.book_outlined, color: color, size: 22),
                                  ),
                                  const SizedBox(width: 14),
                                  // Subject name
                                  Expanded(
                                    child: Text(
                                      grade.subject,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  // Score badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: color.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      grade.score.toStringAsFixed(1),
                                      style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
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
}
