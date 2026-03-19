import 'package:flutter/material.dart';

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      // Padding bottom 20 để cách đáy màn hình một khoảng an toàn
      padding: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Text(
          'Phiên bản 2.1.0.0\nCopyright FPT Schools',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}