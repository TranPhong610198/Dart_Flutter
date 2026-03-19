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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['token'] ?? '', // API returns 'token'
      className: json['className'] ?? 'Lớp 10A (Demo)', // Mock
      code: json['code'] ?? 'HS_${json['id'] ?? '000'}', // Mock
      fullName: json['fullName'] ?? '',
      id: json['id'] ?? 0,
      role: json['role'] ?? '',
      schoolName: json['schoolName'] ?? 'FPT Schools', // Mock
    );
  }
}