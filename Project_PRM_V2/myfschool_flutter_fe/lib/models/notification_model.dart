import 'package:myfschool_flutter_fe/models/notification_model.dart';

class NotificationModel {
  final int id;
  final String title;
  final String content;
  final String createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }
}
