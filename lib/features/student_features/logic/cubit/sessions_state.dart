import 'package:freezed_annotation/freezed_annotation.dart';

part  'sessions_state.freezed.dart';


@freezed
class SessionsState<T> with _$SessionsState {
  
  const factory SessionsState.initial() = _Initial;
  const factory SessionsState.loading() = Loading;
  const factory SessionsState.success(T data) = Success<T>;
  const factory SessionsState.fail(String message) = Fail;
}
