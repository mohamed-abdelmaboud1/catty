import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
abstract class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.initial() = AsyncInitial<T>;

  const factory AsyncState.loading() = AsyncLoading<T>;

  const factory AsyncState.success(T data) = AsyncSuccess<T>;

  const factory AsyncState.failure({@Default(null) dynamic failure}) =
      AsyncFailure<T>;
}
