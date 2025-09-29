import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_model.g.dart';
@JsonSerializable()
class SignUpRequest {
  String username;
  String email;
  String password;
  int age;
  String phone;
  String role;

  SignUpRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.age,
    required this.role,
  });
factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
  
}
@JsonSerializable()
class SignUpResponse {
  String? message;
 

  SignUpResponse({this.message});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}