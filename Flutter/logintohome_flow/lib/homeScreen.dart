import 'package:flutter/material.dart';

import 'loginScreen.dart'; // Import để có thể quay về màn hình Login

class HomeScreen extends StatelessWidget {
  // 1. Khai báo một biến final để chứa dữ liệu truyền sang.
  // Trong StatelessWidget, dữ liệu không đổi nên dùng 'final'.
  final String username;

  // 2. Tạo Constructor yêu cầu bắt buộc (required) phải có username khi gọi màn hình này
  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          // Thêm nút Đăng xuất (Logout) ở góc phải của AppBar
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () {
              // 3. Thực thi nghiệp vụ Đăng xuất
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) =>
                    false, // Điều kiện false: xóa sạch mọi màn hình cũ trong Stack
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 4. Hiển thị lời chào
            Text(
              "Hello $username!",
              // Cú pháp $ biến string nội suy (String interpolation)
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text("Đây là màn hình Home", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
