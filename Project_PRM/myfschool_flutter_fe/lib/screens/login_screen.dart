import 'package:flutter/material.dart';


import 'home_screen.dart';
import 'verify_email.dart';

import 'package:myfschool_flutter_fe/widgets/input_label.dart';
import 'package:myfschool_flutter_fe/widgets/custom_text_field.dart';
import 'package:myfschool_flutter_fe/widgets/or_divider.dart';
import 'package:myfschool_flutter_fe/widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Senior Note: Luôn dispose controller để tránh leak memory
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                image: AssetImage('assets/images/FPT_logo_2010.svg.png'),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
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
              const OrDivider(),

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
              const Center(
                child: Text(
                  'Phiên bản 2.1.0.0\nCopyright FPT Schools',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
