import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/timetable_model.dart';

class TimetableController {
  final String baseUrl = 'http://10.0.2.2:8080/api';

  Future<List<TimetableModel>> getTimetableByStudent(String token, int studentId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/timetables/student/$studentId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data.map((json) => TimetableModel.fromJson(json)).toList();
    } else {
      throw Exception('Không thể tải thời khóa biểu: ${response.statusCode}');
    }
  }
}
