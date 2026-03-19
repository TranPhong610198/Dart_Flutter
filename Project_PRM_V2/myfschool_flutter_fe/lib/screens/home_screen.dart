import 'package:flutter/material.dart';
import 'package:myfschool_flutter_fe/models/user_model.dart';
import '../models/notification_model.dart';
import '../controller/notification_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'notification_detail_screen.dart';
import 'notification_list_screen.dart';
import 'timetable_screen.dart';
import 'grades_screen.dart';
import 'attendance_screen.dart';
import 'requests_screen.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationController _notificationController = NotificationController();
  List<NotificationModel> _notifications = [];
  bool _isLoadingNotifications = true;

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    try {
      final notifications = await _notificationController.getNotifications(widget.user.accessToken);
      if (mounted) {
        setState(() {
          _notifications = notifications;
          _isLoadingNotifications = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingNotifications = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể tải thông báo: $e')),
        );
      }
    }
  }

  void _onNavTap(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationListScreen(user: widget.user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine grid items based on role
    List<Widget> gridItems = [];
    if (widget.user.role == 'ROLE_PARENTS') {
      gridItems.add(_buildMenuItem(
        Icons.edit_note, 'Đơn từ', Colors.purple.shade100, Colors.purple,
        onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => RequestsScreen(user: widget.user))),
      ));
    }
    gridItems.add(_buildMenuItem(
      Icons.assignment_turned_in_outlined, 'Điểm danh', Colors.blue.shade100, Colors.blue,
      onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => AttendanceScreen(user: widget.user))),
    ));
    gridItems.add(_buildMenuItem(
      Icons.grid_view, 'Bảng điểm', Colors.cyan.shade100, Colors.cyan,
      onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => GradesScreen(user: widget.user))),
    ));
    gridItems.add(_buildMenuItem(
      Icons.calendar_month, 'TKB', Colors.orange.shade100, Colors.orange,
      onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => TimetableScreen(user: widget.user))),
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFFDECDA), // Màu nền cam nhạt của app
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header: Logo và Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/FPT_Education_logo.svg/1200px-FPT_Education_logo.svg.png',
                        height: 30,
                      ),
                      const Text(
                        'FPT SCHOOLS',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (route) => false),
                        icon: const Icon(Icons.logout, size: 28),)
                    ],
                  )
                ],
              ),
            ),

            // 2. Thẻ Thông tin sinh viên (Orange Card)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 40, color: Colors.grey),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.user.fullName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.user.code,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(Icons.door_front_door_outlined, color: Colors.white, size: 20),
                        const SizedBox(width: 5),
                        Text(widget.user.className, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 20),
                        const Icon(Icons.business, color: Colors.white, size: 20),
                        const SizedBox(width: 5),
                        Expanded( 
                          child: Text(
                            widget.user.schoolName,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 3. Grid Menu (White Container)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: gridItems.length < 4 && gridItems.isNotEmpty ? gridItems.length : 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
                children: gridItems,
              ),
            ),

            const SizedBox(height: 15),

            // 4. Notifications Section
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Thông báo mới nhất',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: _isLoadingNotifications
                          ? const Center(child: CircularProgressIndicator(color: Colors.orange))
                          : _notifications.isEmpty
                              ? const Center(child: Text('Không có thông báo nào.'))
                              : ListView.separated(
                                  itemCount: _notifications.length,
                                  separatorBuilder: (context, index) => const Divider(),
                                  itemBuilder: (context, index) {
                                    final item = _notifications[index];
                                    
                                    // Make date string readable
                                    String dateReadable = item.createdAt;
                                    if(dateReadable.contains('T')) {
                                       dateReadable = dateReadable.replaceAll('T', ' ').substring(0, 16);
                                    }

                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: const CircleAvatar(
                                        backgroundColor: Color(0xFFFDECDA),
                                        child: Icon(Icons.notifications_active, color: Colors.orange),
                                      ),
                                      title: Text(
                                        item.title,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Text(
                                            item.content,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            dateReadable, 
                                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NotificationDetailScreen(notification: item),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 5. Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: _onNavTap,
      ),
    );
  }


  // Widget phụ trợ để tạo từng item trong Grid
  Widget _buildMenuItem(IconData icon, String label, Color bgColor, Color iconColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
