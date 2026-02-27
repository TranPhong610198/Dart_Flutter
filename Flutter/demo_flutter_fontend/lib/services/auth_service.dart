// File nay chi lam viec voi internet
import 'dart:convert';
import 'dart:io'; // Bắt buộc import thư viện này để dùng SocketException
import 'dart:async'; // Bắt buộc import thư viện này để dùng TimeoutException
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:8080/api/auth';

  Future<String> login(String username, String password) async {
    try {
      // Thêm .timeout() vào cuối lệnh http.post
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      ).timeout(const Duration(seconds: 10)); // Chỉ đợi tối đa 10 giây

      final data = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        return data['token'];
      } else {
        throw Exception(data['message'] ?? 'Đăng nhập thất bại');
      }

    } on SocketException {
      // Bắt lỗi khi mất mạng hoặc Server Spring Boot đang tắt hoàn toàn
      throw Exception('Không thể kết nối đến máy chủ. Vui lòng kiểm tra lại mạng hoặc Server.');
    } on TimeoutException {
      // Bắt lỗi khi Server đang bật nhưng bị kẹt/quá tải, không trả lời sau 10 giây
      throw Exception('Kết nối quá hạn. Máy chủ phản hồi quá chậm!');
    } catch (e) {
      // Bắt các lỗi vặt khác (lỗi ép kiểu, lỗi JSON...)
      // Nếu là Exception do mình tự ném ra (như sai pass) thì giữ nguyên message
      if (e.toString().contains('Exception:')) {
        rethrow; // Ném tiếp lên cho Controller xử lý
      }
      throw Exception('Đã xảy ra lỗi không xác định: $e');
    }
  }
}