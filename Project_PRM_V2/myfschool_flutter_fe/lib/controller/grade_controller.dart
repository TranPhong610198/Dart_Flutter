import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/grade_model.dart';

class GradeController {
  final String baseUrl = 'http://10.0.2.2:8080/api';

  Future<List<GradeModel>> getGrades(String token, int studentId,
      {String? semester, String? year}) async {
    String url = '$baseUrl/grades/student/$studentId';
    if (semester != null && year != null) {
      url += '?semester=$semester&year=$year';
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((json) => GradeModel.fromJson(json)).toList();
    } else {
      throw Exception('Không thể tải bảng điểm: ${response.statusCode}');
    }
  }
}
