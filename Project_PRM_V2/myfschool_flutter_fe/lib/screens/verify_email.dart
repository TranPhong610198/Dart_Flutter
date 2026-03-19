import 'package:flutter/material.dart';
import '../widgets/copyright_footer.dart';
import 'enter_otp.dart';

import 'package:myfschool_flutter_fe/widgets/input_label.dart';
import 'package:myfschool_flutter_fe/widgets/custom_text_field.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    // Senior Note: Luôn dispose controller để tránh leak memory
    _phoneController.dispose();
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
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                          Icons.arrow_back, color: Colors.black, size: 28),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Xác minh số điện thoại',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mã xác thực sẽ được gửi đến số điện thoại để bạn đặt lại mật khẩu',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 40),

                    const InputLabel(label: 'Số điện thoại'),
                    CustomTextField(controller: _phoneController),

                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF16623),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnterOtpScreen()),
                          );
                        },
                        child: const Text('Xác nhận',
                            style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Spacer(),
                    const CopyrightFooter(),
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
