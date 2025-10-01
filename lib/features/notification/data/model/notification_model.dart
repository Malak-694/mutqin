import 'package:json_annotation/json_annotation.dart';

import '../../../auth/data/model/user_model.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String message;
  final User user;
  final bool isRead;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.message,
    required this.user,
    required this.isRead,
    required this.createdAt,
  });
  
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
