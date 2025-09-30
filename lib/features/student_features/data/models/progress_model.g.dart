// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressModel _$ProgressModelFromJson(Map<String, dynamic> json) =>
    ProgressModel(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      points: json['points'] as String?,
      memorizationLevel: json['memorizationLevel'] as String?,
      newLearnedPages: json['newLearnedPages'] as String?,
      revisionPages: json['revisionPages'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      sessionsAttended: json['sessionsAttended'] as String?,
    );

Map<String, dynamic> _$ProgressModelToJson(ProgressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'points': instance.points,
      'memorizationLevel': instance.memorizationLevel,
      'newLearnedPages': instance.newLearnedPages,
      'revisionPages': instance.revisionPages,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'sessionsAttended': instance.sessionsAttended,
    };

ProgressUser _$ProgressUserFromJson(Map<String, dynamic> json) => ProgressUser(
  id: json['id'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  age: json['age'] as String?,
  phone: json['phone'] as String?,
  memorizationleveltype: json['memorizationleveltype'] as String?,
  points: json['points'] as String?,
  googleId: json['googleId'] as String?,
  provider: json['provider'] as String?,
  profilePictureUrl: json['profilePictureUrl'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$ProgressUserToJson(ProgressUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'phone': instance.phone,
      'memorizationleveltype': instance.memorizationleveltype,
      'points': instance.points,
      'googleId': instance.googleId,
      'provider': instance.provider,
      'profilePictureUrl': instance.profilePictureUrl,
      'role': instance.role,
    };
