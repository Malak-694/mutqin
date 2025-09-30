
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutors_state.freezed.dart';

@freezed
class TutorsState<T> with _$TutorsState {
  
  const factory TutorsState.initial() = _Initial;
  const factory TutorsState.loading() = Loading;
  const factory TutorsState.success(T data) = Success<T>;
  const factory TutorsState.fail(String message) = Fail;
}
