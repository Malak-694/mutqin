// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  age: json['age'] as String?,
  phone: json['phone'] as String?,
  memorizationleveltype: json['memorizationleveltype'] as String?,
  points: json['points'] as String?,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'password': instance.password,
  'age': instance.age,
  'phone': instance.phone,
  'memorizationleveltype': instance.memorizationleveltype,
  'points': instance.points,
  'profilePictureUrl': instance.profilePictureUrl,
  'role': instance.role,
};
