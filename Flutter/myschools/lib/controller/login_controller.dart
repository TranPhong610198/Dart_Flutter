// File nay se goi service va lenh cho giao dien ve lai
import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Nối với tầng Service

// ChangeNotifier giúp class này có khả năng "phát thanh" thông báo đến UI
class LoginController extends ChangeNotifier {
  final AuthService _authService = AuthService(); // Gọi thằng lính đánh thuê Service

  bool isLoading = false;
  String errorMessage = '';

  // Hàm này xử lý logic, trả về Token (String) hoặc null nếu tạch
  Future<String?> handleLogin(String username, String password) async {
    // 1. Logic kiểm tra rỗng
    if (username.trim().isEmpty || password.trim().isEmpty) {
      errorMessage = "Vui lòng nhập đầy đủ tài khoản và mật khẩu";
      notifyListeners(); // Báo cho UI: "Ê, vẽ lại đi, tao vừa cập nhật lỗi!"
      return null;
    }

    // 2. Bắt đầu gọi API
    isLoading = true;
    errorMessage = '';
    notifyListeners(); // Báo cho UI: "Bật vòng xoay loading lên!"

    try {
      // Nhờ tầng Service đi lấy token về
      String token = await _authService.login(username, password);

      // Lấy thành công
      isLoading = false;
      notifyListeners(); // Tắt vòng xoay loading
      return token;

    } catch (e) {
      // Lấy thất bại (Sai pass, rớt mạng...)
      isLoading = false;
      // Xóa chữ "Exception: " thừa thãi đi để câu báo lỗi đẹp hơn
      errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners(); // Báo UI vẽ lại thông báo lỗi màu đỏ
      return null;
    }
  }
}