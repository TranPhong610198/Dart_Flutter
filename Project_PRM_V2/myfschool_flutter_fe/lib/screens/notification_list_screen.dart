import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/notification_model.dart';
import '../controller/notification_controller.dart';
import 'notification_detail_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

import 'home_screen.dart';

class NotificationListScreen extends StatefulWidget {
  final UserModel user;

  const NotificationListScreen({super.key, required this.user});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  final NotificationController _notificationController = NotificationController();
  List<NotificationModel> _notifications = [];
  bool _isLoading = true;

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
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể tải thông báo: $e')),
        );
      }
    }
  }

  void _onNavTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: widget.user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tất cả thông báo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false, // Handle via nav bar
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.orange))
          : _notifications.isEmpty
              ? const Center(child: Text('Không có thông báo nào.'))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _notifications.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = _notifications[index];
                    
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
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            item.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            dateReadable,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
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
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // 1 = Notifications
        onTap: _onNavTap,
      ),
    );
  }
}
