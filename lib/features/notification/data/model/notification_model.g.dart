// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  id: json['id'] as String,
  message: json['message'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  isRead: json['isRead'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
  'id': instance.id,
  'message': instance.message,
  'user': instance.user,
  'isRead': instance.isRead,
  'createdAt': instance.createdAt.toIso8601String(),
};
