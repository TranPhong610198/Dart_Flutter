// lib/models/user_model.dart

class UserModel {
  final String accessToken;
  final String className;
  final String code;
  final String fullName;
  final int id;
  final String role;
  final String schoolName;

  UserModel({
    required this.accessToken,
    required this.className,
    required this.code,
    required this.fullName,
    required this.id,
    required this.role,
    required this.schoolName,
  });

  // Factory map JSON từ API sang Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['accessToken'] ?? '',
      className: json['className'] ?? '',
      code: json['code'] ?? '',
      fullName: json['fullName'] ?? '',
      id: json['id'] ?? 0,
      role: json['role'] ?? '',
      schoolName: json['schoolName'] ?? '',
    );
  }
}