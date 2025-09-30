// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRequestModel _$BookRequestModelFromJson(Map<String, dynamic> json) =>
    BookRequestModel(
      studentId: (json['studentId'] as num?)?.toInt(),
      tutorId: (json['tutorId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookRequestModelToJson(BookRequestModel instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'tutorId': instance.tutorId,
    };

BookResponseModel _$BookResponseModelFromJson(Map<String, dynamic> json) =>
    BookResponseModel(
      message: json['message'] as String?,
      scheduling_url: json['scheduling_url'] as String?,
    );

Map<String, dynamic> _$BookResponseModelToJson(BookResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'scheduling_url': instance.scheduling_url,
    };
