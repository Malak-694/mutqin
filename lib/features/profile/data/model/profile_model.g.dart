// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: json['id'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  age: json['age'] as String?,
  points: json['points'] as String?,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'age': instance.age,
      'points': instance.points,
      'profilePictureUrl': instance.profilePictureUrl,
      'phone': instance.phone,
      'role': instance.role,
    };
