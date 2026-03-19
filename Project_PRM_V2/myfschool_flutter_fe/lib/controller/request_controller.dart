import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/request_model.dart';

class RequestApiController {
  final String baseUrl = 'http://10.0.2.2:8080/api';

  Future<List<RequestModel>> getRequestsByParent(String token, int parentId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/requests/parent/$parentId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((j) => RequestModel.fromJson(j)).toList();
    } else {
      throw Exception('Không thể tải danh sách đơn từ: ${response.statusCode}');
    }
  }

  Future<RequestModel> createRequest(String token, int parentId, int studentId,
      String typeOfRequest, String content) async {
    final response = await http.post(
      Uri.parse('$baseUrl/requests'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'parentId': parentId,
        'studentId': studentId,
        'typeOfRequest': typeOfRequest,
        'content': content,
      }),
    );
    if (response.statusCode == 200) {
      return RequestModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Gửi đơn thất bại: ${response.statusCode}');
    }
  }
}
