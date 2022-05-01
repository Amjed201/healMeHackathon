import 'package:logistic/models/offer.dart';

class NotificationModel {
  NotificationModel({
    required this.userId,
    required this.title,
    required this.message,
    required this.image,
    required this.type,
    required this.targetId,
    required this.offer,
  });

  int userId;
  String? title;
  String? message;
  String? image;
  String? type;
  int? targetId;
  Deals? offer;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
      userId: json["user_id"],
      title: json["title"] ?? '',
      message: json["massage"] ?? '',
      type: json["type"] ?? '',
      targetId: json["target_id"] ?? 0,
      image: json["image"] ?? '',
      offer: json["offer"] == null ? null : Deals.fromJson(json["offer"]));
}
