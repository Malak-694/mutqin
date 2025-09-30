import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String? id;
  String? username;
  String? email;
  String? age;
  String? points;
  String? profilePictureUrl;
  String? phone;
  String? role;

  ProfileModel({
    this.id,
    this.username,
    this.email,
    this.age,
    this.points,
    this.profilePictureUrl,
    this.phone,
    this.role,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
