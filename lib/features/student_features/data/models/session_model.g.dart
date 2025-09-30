// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) => SessionModel(
  sessionId: json['sessionId'] as String?,
  status: json['status'] as String?,
  date: json['date'] as String?,
  sheikhId: json['sheikhId'] as String?,
  studentUsername: json['studentUsername'] as String?,
  sheikhUsername: json['sheikhUsername'] as String?,
);

Map<String, dynamic> _$SessionModelToJson(SessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'status': instance.status,
      'date': instance.date,
      'sheikhId': instance.sheikhId,
      'studentUsername': instance.studentUsername,
      'sheikhUsername': instance.sheikhUsername,
    };
