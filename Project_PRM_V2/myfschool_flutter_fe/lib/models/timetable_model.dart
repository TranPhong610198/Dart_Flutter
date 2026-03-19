class TimetableModel {
  final int id;
  final String subject;
  final String classTime;
  final String room;
  final String studentName;

  TimetableModel({
    required this.id,
    required this.subject,
    required this.classTime,
    required this.room,
    required this.studentName,
  });

  factory TimetableModel.fromJson(Map<String, dynamic> json) {
    return TimetableModel(
      id: json['id'] ?? 0,
      subject: json['subject'] ?? '',
      classTime: json['classTime'] ?? '',
      room: json['room'] ?? '',
      studentName: json['studentName'] ?? '',
    );
  }
}
