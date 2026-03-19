import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/request_model.dart';
import '../controller/request_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'notification_list_screen.dart';

class RequestsScreen extends StatefulWidget {
  final UserModel user;

  const RequestsScreen({super.key, required this.user});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final RequestApiController _requestController = RequestApiController();
  List<RequestModel> _requests = [];
  bool _isLoading = true;

  // Predefined request types parents can choose from
  final List<String> _requestTypes = [
    'Xin nghỉ học có phép',
    'Xin phép đến muộn',
    'Đề nghị gặp giáo viên',
    'Phản ánh về học tập',
    'Khác',
  ];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    setState(() => _isLoading = true);
    try {
      final data = await _requestController.getRequestsByParent(
          widget.user.accessToken, widget.user.id);
      if (mounted) {
        setState(() {
          _requests = data;
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

  void _showCreateDialog() async {
    final prefs = await SharedPreferences.getInstance();
    final studentIdStr = prefs.getString('selectedChildId');
    final int studentId = (studentIdStr != null && studentIdStr.isNotEmpty)
        ? int.tryParse(studentIdStr) ?? 0
        : 0;

    if (studentId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không tìm thấy thông tin học sinh. Vui lòng đăng nhập lại.')),
      );
      return;
    }

    String selectedType = _requestTypes[0];
    final contentController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            'Gửi đơn mới',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Loại đơn', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedType,
                      items: _requestTypes.map((t) => DropdownMenuItem(
                        value: t,
                        child: Text(t, style: const TextStyle(fontSize: 13)),
                      )).toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => selectedType = val);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Nội dung', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 8),
                TextField(
                  controller: contentController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Mô tả chi tiết...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Huỷ', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async {
                final content = contentController.text.trim();
                if (content.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng nhập nội dung đơn')),
                  );
                  return;
                }
                Navigator.pop(ctx);
                try {
                  await _requestController.createRequest(
                    widget.user.accessToken,
                    widget.user.id,
                    studentId,
                    selectedType,
                    content,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Gửi đơn thành công!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  _loadRequests(); // Refresh list
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
                  );
                }
              },
              child: const Text('Gửi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
    contentController.dispose();
  }

  Color _statusColor(String status) {
    switch (status.toUpperCase()) {
      case 'APPROVED':
        return Colors.green.shade600;
      case 'REJECTED':
        return Colors.red.shade600;
      default:
        return Colors.orange.shade700; // PENDING
    }
  }

  String _statusLabel(String status) {
    switch (status.toUpperCase()) {
      case 'APPROVED':
        return 'Đã duyệt';
      case 'REJECTED':
        return 'Từ chối';
      default:
        return 'Chờ duyệt';
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showCreateDialog,
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Gửi đơn', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
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
                      'Đơn từ',
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

            // --- Summary counts ---
            if (!_isLoading && _requests.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _chip('Tổng', _requests.length, Colors.blue.shade600),
                    const SizedBox(width: 8),
                    _chip('Chờ duyệt',
                        _requests.where((r) => r.status == 'PENDING').length,
                        Colors.orange.shade700),
                    const SizedBox(width: 8),
                    _chip('Đã duyệt',
                        _requests.where((r) => r.status == 'APPROVED').length,
                        Colors.green.shade600),
                  ],
                ),
              ),

            const SizedBox(height: 14),

            // --- List ---
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                  : _requests.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.inbox_outlined,
                                  size: 64, color: Colors.orange.shade200),
                              const SizedBox(height: 12),
                              const Text('Chưa có đơn từ nào',
                                  style: TextStyle(color: Colors.grey, fontSize: 16)),
                              const SizedBox(height: 6),
                              const Text('Nhấn "Gửi đơn" để tạo đơn mới',
                                  style: TextStyle(color: Colors.grey, fontSize: 13)),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _requests.length,
                          itemBuilder: (context, index) {
                            final req = _requests[index];
                            final color = _statusColor(req.status);
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.06),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          req.typeOfRequest,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: color.withOpacity(0.12),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          _statusLabel(req.status),
                                          style: TextStyle(
                                              color: color,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (req.content.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      req.content,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.black54),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.person_outline, size: 14, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text('HV: ${req.studentName}',
                                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
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

  Widget _chip(String label, int count, Color color) {
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
            Text('$count',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label,
                style: TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w600, color: color)),
          ],
        ),
      ),
    );
  }
}
