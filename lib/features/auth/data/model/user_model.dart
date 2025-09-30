import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? username;
  String? email;
  String? password;
  String? age;
  String? phone;
  String? memorizationleveltype; // <-- was Null? (fixed)
  String? points;
  String? profilePictureUrl; // <-- was Null? (fixed)
  String? role;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.age,
    this.phone,
    this.memorizationleveltype,
    this.points,
    this.profilePictureUrl,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
