class RequestModel {
  final int id;
  final String typeOfRequest;
  final String status;
  final String content;
  final String parentName;
  final String studentName;

  RequestModel({
    required this.id,
    required this.typeOfRequest,
    required this.status,
    required this.content,
    required this.parentName,
    required this.studentName,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] ?? 0,
      typeOfRequest: json['typeOfRequest'] ?? '',
      status: json['status'] ?? '',
      content: json['content'] ?? '',
      parentName: json['parentName'] ?? '',
      studentName: json['studentName'] ?? '',
    );
  }
}
