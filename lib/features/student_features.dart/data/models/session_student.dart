// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SessionStudent extends Equatable {
  String? sessionId;
  String? status;
  String? date;
  String? sheikhId;

  SessionStudent({
    this.sessionId,
    this.status,
    this.date,
    this.sheikhId,
  });

  SessionStudent.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    status = json['status'];
    date = json['date'];
    sheikhId = json['sheikh_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['status'] = this.status;
    data['date'] = this.date;
    data['sheikh_id'] = this.sheikhId;
    return data;
  }

  @override
  List<Object?> get props => [sessionId, status, date, sheikhId];
}
