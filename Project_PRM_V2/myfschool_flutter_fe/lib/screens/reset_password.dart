import 'package:flutter/material.dart';
import 'package:myfschool_flutter_fe/widgets/copyright_footer.dart';

import 'package:myfschool_flutter_fe/widgets/input_label.dart';
import 'package:myfschool_flutter_fe/widgets/password_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Senior Note: Luôn dispose controller để tránh leak memory
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 68),
                    const Text(
                      'Đặt lại mật khẩu',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),

                    // Mật khẩu
                    const InputLabel(label: 'Mật khẩu'),
                    PasswordTextField(controller: _passwordController),
                    const SizedBox(height: 20),

                    // Xác nhận mật khẩu
                    const InputLabel(label: 'Xác nhận mật khẩu'),
                    PasswordTextField(controller: _confirmPasswordController),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF16623),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          // Quay về trang Login
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        child: const Text('Đăng nhập',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Spacer(),
                    const CopyrightFooter()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
