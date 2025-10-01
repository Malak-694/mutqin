import 'package:freezed_annotation/freezed_annotation.dart';
part 'teacher_sessions_state.freezed.dart';

@freezed
class SheikhSessionsState<T> with _$SheikhSessionsState {
  const factory SheikhSessionsState.initial() = _Initial;
  const factory SheikhSessionsState.loading() = Loading;
  const factory SheikhSessionsState.success(T data) = Success<T>;
  const factory SheikhSessionsState.fail(String message) = Fail;
}
