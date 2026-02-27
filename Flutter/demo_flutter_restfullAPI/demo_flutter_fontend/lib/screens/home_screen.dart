import 'package:flutter/material.dart';
import 'login_screen.dart';
// Nếu bạn tách file, nhớ import file chứa LoginScreen vào đây để làm nút Đăng xuất nhé.

class HomeScreen extends StatelessWidget {
  final String username;
  final String token;

  // Constructor yêu cầu phải truyền username và token khi gọi màn hình này
  const HomeScreen({super.key, required this.username, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang Chủ"),
        actions: [
          // Nút đăng xuất (quay lại màn hình Login và xóa lịch sử)
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Trong thực tế, ở đây sẽ có thêm code xóa Token khỏi bộ nhớ đệm (SharedPreferences)
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
              );
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Chào mừng, $username!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              SizedBox(height: 20),
              Text(
                "Đăng nhập qua REST API thành công.\nĐây là Token Server cấp cho bạn:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Hiển thị token để xác nhận dữ liệu đã được truyền đi an toàn
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Text(
                  token,
                  style: TextStyle(fontFamily: 'monospace', color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}