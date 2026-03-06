import 'package:flutter/material.dart';
import 'package:myfschool_flutter_fe/widgets/copyright_footer.dart';
import 'reset_password.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

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
                      child: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Nhập mã OTP',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Vui lòng xác thực mã OTP đã gửi đến số điện thoại của quý phụ huynh',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) => SizedBox(
                        width: 65,
                        height: 70,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) FocusScope.of(context).nextFocus();
                          },
                        ),
                      )),
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                          );
                        },
                        child: const Text('Xác nhận',
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
