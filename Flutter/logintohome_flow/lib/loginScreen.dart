import 'package:flutter/material.dart';

import 'homeScreen.dart';

// Chuyển sang StatefulWidget để quản lý vòng đời của các Controller
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Tạo 2 controller để "lắng nghe" và lấy dữ liệu từ TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Hàm dispose luôn đi kèm với StatefulWidget để dọn dẹp bộ nhớ khi màn hình bị hủy
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Tách logic đăng nhập ra một hàm riêng cho code sạch (Clean Code)
  void _handleLogin() {
    // Lấy text người dùng nhập và xóa khoảng trắng thừa ở hai đầu bằng .trim()
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username == 'admin' && password == 'admin123') {
      // Đăng nhập thành công -> Chuyển trang và truyền dữ liệu
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // Chú ý: Truyền biến username vào HomeScreen
          builder: (context) => HomeScreen(username: username),
        ),
      );
    } else {
      // Đăng nhập thất bại -> Hiển thị thông báo (SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sai tài khoản hoặc mật khẩu!"),
          backgroundColor: Colors.red, // Đổi màu nền thành đỏ cho lỗi
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController, // Gắn controller vào TextField
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText:
                  true, // Biến chữ thành dấu chấm/sao để bảo mật mật khẩu
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleLogin, // Gọi hàm xử lý khi bấm nút
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
