import 'package:flutter/material.dart';
import 'package:myfschool_flutter_fe/models/user_model.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserModel user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                      const Icon(Icons.notifications_none_outlined, size: 28),
                      const SizedBox(width: 15),
                      // Icon(Icons.logout, size: 28),
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
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
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
                              user.fullName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.code,
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
                        Text(user.className, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 20),
                        const Icon(Icons.business, color: Colors.white, size: 20),
                        const SizedBox(width: 5),
                        Expanded( // Dùng Expanded đề phòng tên trường quá dài bị lỗi tràn màn hình
                          child: Text(
                            user.schoolName,
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

            // 3. Grid Menu (White Container)
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.all(20),
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        children: [
                          _buildMenuItem(Icons.edit_note, 'Đơn từ', Colors.purple.shade100, Colors.purple),
                          _buildMenuItem(Icons.phone_in_talk_outlined, 'Liên hệ', Colors.blue.shade100, Colors.blue),
                          _buildMenuItem(Icons.menu_book, 'BTVN', Colors.red.shade100, Colors.red),
                          _buildMenuItem(Icons.grid_view, 'Bảng điểm', Colors.cyan.shade100, Colors.cyan),
                          _buildMenuItem(Icons.restaurant, 'Bán trú', Colors.green.shade100, Colors.green),
                          _buildMenuItem(Icons.account_balance_wallet_outlined, 'Học phí', Colors.lightGreen.shade100, Colors.green),
                          _buildMenuItem(Icons.calendar_month, 'TKB', Colors.orange.shade100, Colors.orange),
                          _buildMenuItem(Icons.groups_outlined, 'CLB', Colors.yellow.shade100, Colors.orange),
                        ],
                      ),
                    ),
                    // Dấu chấm phân trang (Page Indicator)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 8, height: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black)),
                        const SizedBox(width: 5),
                        Container(width: 8, height: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey)),
                        const SizedBox(width: 5),
                        Container(width: 8, height: 8, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),

      // 4. Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_outlined), label: 'Điểm danh'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bus_filled_outlined), label: 'Đưa đón'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Tôi'),
        ],
      ),
    );
  }

  // Widget phụ trợ để tạo từng item trong Grid
  Widget _buildMenuItem(IconData icon, String label, Color bgColor, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}