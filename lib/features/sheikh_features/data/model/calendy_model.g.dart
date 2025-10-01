// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendyModel _$CalendyModelFromJson(Map<String, dynamic> json) =>
    CalendyModel(link: json['link'] as String?);

Map<String, dynamic> _$CalendyModelToJson(CalendyModel instance) =>
    <String, dynamic>{'link': instance.link};

CalendyResponseModel _$CalendyResponseModelFromJson(
  Map<String, dynamic> json,
) => CalendyResponseModel(
  id: json['id'] as String?,
  user: json['user'] == null
      ? null
      : ProgressUser.fromJson(json['user'] as Map<String, dynamic>),
  eventUri: json['eventUri'] as String?,
);

Map<String, dynamic> _$CalendyResponseModelToJson(
  CalendyResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'eventUri': instance.eventUri,
};
