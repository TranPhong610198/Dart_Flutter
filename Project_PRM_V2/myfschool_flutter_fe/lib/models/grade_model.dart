class GradeModel {
  final int id;
  final String subject;
  final String semester;
  final String schoolYear;
  final double score;
  final String studentName;

  GradeModel({
    required this.id,
    required this.subject,
    required this.semester,
    required this.schoolYear,
    required this.score,
    required this.studentName,
  });

  factory GradeModel.fromJson(Map<String, dynamic> json) {
    return GradeModel(
      id: json['id'] ?? 0,
      subject: json['subject'] ?? '',
      semester: json['semester'] ?? '',
      schoolYear: json['schoolYear'] ?? '',
      score: (json['score'] ?? 0).toDouble(),
      studentName: json['studentName'] ?? '',
    );
  }
}
