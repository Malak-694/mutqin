import 'package:freezed_annotation/freezed_annotation.dart';
part 'teacher_student_progress_state.freezed.dart';

@freezed
class SheikhStudentProgressState<T> with _$SheikhStudentProgressState {
  const factory SheikhStudentProgressState.initial() = _Initial;
  const factory SheikhStudentProgressState.loading() = Loading;
  const factory SheikhStudentProgressState.success(T data) = Success<T>;
  const factory SheikhStudentProgressState.fail(String message) = Fail;
}
