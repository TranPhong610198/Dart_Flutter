import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart'; // Đảm bảo import đúng đường dẫn

class AuthController {

  // Thêm constant baseUrl để dễ dùng lại
  static const String baseUrl = 'http://10.0.2.2:8080/api';

  Future<UserModel> login(String phone, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');

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
        throw Exception('Tài khoản hoặc mật khẩu không chính xác!');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }

  // API Lấy danh sách con cho phụ huynh
  Future<List<UserModel>> getChildren(int parentId, String token) async {
    final url = Uri.parse('$baseUrl/users/parents/$parentId/children');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> dataList = jsonDecode(response.body);
        return dataList.map((data) {
          // Gắn token của cha luôn để dùng api cho thằng con này
          data['token'] = token;
          return UserModel.fromJson(data);
        }).toList();
      } else {
        throw Exception('Không thể lấy danh sách học sinh!');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối API lấy danh sách: $e');
    }
  }
}