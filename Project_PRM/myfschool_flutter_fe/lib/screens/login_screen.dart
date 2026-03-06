import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'verify_email.dart';

import 'package:myfschool_flutter_fe/widgets/input_label.dart';
import 'package:myfschool_flutter_fe/widgets/custom_text_field.dart';
import 'package:myfschool_flutter_fe/widgets/password_text_field.dart';
import 'package:myfschool_flutter_fe/widgets/copyright_footer.dart';

import 'package:myfschool_flutter_fe/controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;
  bool _isLoading = false;

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authController = AuthController();

  @override
  void dispose() {
    // Senior Note: Luôn dispose controller để tránh leak memory
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ số điện thoại và mật khẩu')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = await _authController.login(phone, password);

      // Nếu không có lỗi, chuyển sang HomeScreen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(user: user),
          ),
        );
      }
    } catch (e) {
      // Hiển thị lỗi từ Controller ném ra (đã loại bỏ chữ "Exception: " thừa thãi)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Logo Section
              const Image(
                // width: double.infinity,
                height: 60,
                image: AssetImage('assets/images/FPT_logo_2010.png'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Chào Mừng Quý Phụ Huynh',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              // Số điện thoại
              const InputLabel(label: 'Số điện thoại'),
              CustomTextField(controller: _phoneController),

              const SizedBox(height: 20),

              // Mật khẩu & Quên mật khẩu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InputLabel(label: 'Mật khẩu'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerifyEmailScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Quên mật khẩu ?',
                      style: TextStyle(color: Color(0xFFF16623)),
                    ),
                  ),
                ],
              ),
              PasswordTextField(controller: _passwordController),

              // Ghi nhớ đăng nhập
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    activeColor: const Color(0xFFF16623),
                    onChanged: (val) => setState(() => _rememberMe = val!),
                  ),
                  const Text('Lưu thông tin đăng nhập'),
                ],
              ),

              const SizedBox(height: 20),

              // Nút Đăng nhập
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF16623),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isLoading ? null : _handleLogin,
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Divider "Hoặc"
              const _OrDivider(),

              const SizedBox(height: 20),

              // Nút FEID
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFFEFE7)),
                    backgroundColor: const Color(0xFFFFEFE7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'FEID',
                    style: TextStyle(
                      color: Color(0xFFF16623),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 180),
              // Footer
              const CopyrightFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Hoặc đăng nhập bằng',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
