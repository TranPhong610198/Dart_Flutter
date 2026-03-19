class AttendanceModel {
  final int id;
  final String date;
  final String status;
  final String studentName;

  AttendanceModel({
    required this.id,
    required this.date,
    required this.status,
    required this.studentName,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      studentName: json['studentName'] ?? '',
    );
  }
}
