import 'package:json_annotation/json_annotation.dart';
part 'book_session.g.dart';
@JsonSerializable()
class BookRequestModel {
  int? studentId;

  int? tutorId;
  BookRequestModel({this.studentId, this.tutorId});
    factory BookRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookRequestModelToJson(this);
}
@JsonSerializable()

class BookResponseModel {
  String? message;
  String? scheduling_url;
  BookResponseModel({this.message, this.scheduling_url});
  factory BookResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseModelToJson(this);
}
