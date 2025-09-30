// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'session_model.g.dart';

@JsonSerializable()
class SessionModel {
  String? sessionId;
  String? status;
  String? date;
  String? sheikhId;
  String? studentUsername;
  String? sheikhUsername;

  SessionModel({
    this.sessionId,
    this.status,
    this.date,
    this.sheikhId,
    this.studentUsername,
    this.sheikhUsername,
  });
  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}

