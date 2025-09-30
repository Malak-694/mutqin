import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_state.freezed.dart';

@freezed
class BookState<T> with _$BookState {
  const factory BookState.initial() = _Initial;
  const factory BookState.loading() = Loading;
  const factory BookState.success(T data) = Success<T>;
  const factory BookState.fail(String message) = Fail;
}
