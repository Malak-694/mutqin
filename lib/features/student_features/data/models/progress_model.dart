// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';


part 'progress_model.g.dart';

@JsonSerializable()
class ProgressModel {
  String? id;
  ProgressUser? user;
  String? points;
  String? memorizationLevel;
  String? newLearnedPages;
  String? revisionPages;
  String? createdAt;
  String? updatedAt;
  String? sessionsAttended;

  ProgressModel({
    this.id,
    this.user,
    this.points,
    this.memorizationLevel,
    this.newLearnedPages,
    this.revisionPages,
    this.createdAt,
    this.updatedAt,
    this.sessionsAttended,
  });
  factory ProgressModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressModelToJson(this);
}
@JsonSerializable()
class ProgressUser {
  String? id;
  String? username;
  String? email;
  String? password;
  String? age;
  String? phone;
  String? memorizationleveltype;
  String? points;
  String? googleId;
  String? provider;
  String? profilePictureUrl;
  String? role;

  ProgressUser({
    this.id,
    this.username,
    this.email,
    this.password,
    this.age,
    this.phone,
    this.memorizationleveltype,
    this.points,
    this.googleId,
    this.provider,
    this.profilePictureUrl,
    this.role,
  });
  factory ProgressUser.fromJson(Map<String, dynamic> json) =>
      _$ProgressUserFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressUserToJson(this);
}
