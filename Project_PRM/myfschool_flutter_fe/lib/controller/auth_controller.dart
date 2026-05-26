import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart'; // Đảm bảo import đúng đường dẫn

class AuthController {

  Future<UserModel> login(String phone, String password) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phone': phone,
          'password': password,
        }),
      );


      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return UserModel.fromJson(data);

      } else {
        // Ném lỗi để UI bắt được (Xử lý sai pass, không tồn tại user...)
        throw Exception('Tài khoản hoặc mật khẩu không chính xác!');
      }
    } catch (e) {
      // Bắt các lỗi do mất mạng, sập server...
      throw Exception('Lỗi kết nối: $e');
    }
  }
}