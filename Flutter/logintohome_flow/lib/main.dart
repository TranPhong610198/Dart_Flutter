import 'package:flutter/material.dart';

import 'loginScreen.dart'; // Import màn hình đầu tiên bạn muốn hiển thị

void main() {
  runApp(MyApp()); // Lệnh khởi chạy ứng dụng
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Tắt chữ "Debug" ở góc màn hình
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: Định nghĩa màn hình sẽ xuất hiện ngay khi mở app
      home: LoginScreen(),
    );
  }
}
