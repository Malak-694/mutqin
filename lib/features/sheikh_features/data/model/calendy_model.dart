// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:mutqin/features/student_features/data/models/progress_model.dart';

part 'calendy_model.g.dart';

@JsonSerializable()
class CalendyModel {
  String? link;
  CalendyModel({this.link});
  factory CalendyModel.fromJson(Map<String, dynamic> json) =>
      _$CalendyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CalendyModelToJson(this);
}

@JsonSerializable()
class CalendyResponseModel {
  String? id;
  ProgressUser? user;
  String? eventUri;
  CalendyResponseModel({
    required this.id,
    required this.user,
    required this.eventUri,
  });
  factory CalendyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CalendyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CalendyResponseModelToJson(this);

}
