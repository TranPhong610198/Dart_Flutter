import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController {
  final String baseUrl = 'http://10.0.2.2:8080/api';

  Future<List<NotificationModel>> getNotifications(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/notifications'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Backend returns ISO-8859-1 strings sometimes, so decode UTF-8 correctly
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        return data.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notifications: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối đến máy chủ: $e');
    }
  }
}
