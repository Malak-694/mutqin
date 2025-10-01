import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_students_state.freezed.dart';

@freezed
class SheikhStudentsState<T> with _$SheikhStudentsState {
  const factory SheikhStudentsState.initial() = _Initial;
  const factory SheikhStudentsState.loading() = Loading;
  const factory SheikhStudentsState.success(T data) = Success<T>;
  const factory SheikhStudentsState.fail(String message) = Fail;
}
