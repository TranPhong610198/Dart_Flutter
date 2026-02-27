import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import 'home_screen.dart'; // Import màn home của bạn

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // Khởi tạo một anh "Quản đốc" cho màn hình này
  final LoginController _loginController = LoginController();

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    _loginController.dispose(); // Dọn dẹp cả Controller
    super.dispose();
  }

  // Hàm duy nhất xử lý sự kiện bấm nút
  void _onLoginPressed() async {
    // UI chỉ việc ném text cho Controller xử lý, rồi đứng đợi kết quả
    String? token = await _loginController.handleLogin(
      _userController.text,
      _passController.text,
    );

    // Nếu token không null (nghĩa là thành công) VÀ màn hình vẫn đang mở
    if (token != null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            username: _userController.text,
            token: token,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login - Clean Architecture")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // ListenableBuilder là "Cái tai" lắng nghe anh "Quản đốc" ChangeNotifier
        // Khi GỌI notifyListeners() ở Controller, hàm builder này sẽ chạy lại!
        child: ListenableBuilder(
          listenable: _loginController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                TextField(
                  controller: _passController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                // Logic hiển thị lỗi: Chỉ hiện chữ khi biến errorMessage không rỗng
                if (_loginController.errorMessage.isNotEmpty)
                  Text(
                    _loginController.errorMessage,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),

                const SizedBox(height: 20),

                // Logic vẽ nút bấm: Nếu đang tải thì quay, không thì hiện Nút
                _loginController.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _onLoginPressed,
                  child: const Text("Đăng nhập"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}