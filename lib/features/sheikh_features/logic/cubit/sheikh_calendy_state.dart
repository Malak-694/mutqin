import 'package:freezed_annotation/freezed_annotation.dart';
part 'sheikh_calendy_state.freezed.dart';

@freezed
class SheikhCalendyState<T> with _$SheikhCalendyState {
  const factory SheikhCalendyState.initial() = _Initial;
  const factory SheikhCalendyState.loading() = Loading;
  const factory SheikhCalendyState.success(T data) = Success<T>;
  const factory SheikhCalendyState.fail(String message) = Fail;
}
