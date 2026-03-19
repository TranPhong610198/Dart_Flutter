import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/attendance_model.dart';

class AttendanceApiController {
  final String baseUrl = 'http://10.0.2.2:8080/api';

  Future<List<AttendanceModel>> getAttendance(String token, int studentId,
      {int? year, int? month}) async {
    String url = '$baseUrl/attendance/student/$studentId';
    if (year != null && month != null) {
      url += '?year=$year&month=$month';
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
      return data.map((json) => AttendanceModel.fromJson(json)).toList();
    } else {
      throw Exception('Không thể tải dữ liệu điểm danh: ${response.statusCode}');
    }
  }
}
