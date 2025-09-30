import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_state.freezed.dart';

@freezed
class ProgressState<T> with _$ProgressState {
  const factory ProgressState.initial() = _Initial;
  const factory ProgressState.loading() = Loading;
  const factory ProgressState.success(T data) = Success<T>;
  const factory ProgressState.fail(String message) = Fail;
}
