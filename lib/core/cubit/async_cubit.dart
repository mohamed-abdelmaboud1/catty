import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../errors/failure.dart';
import '../extensions/async_state_x.dart';
import 'async_state.dart';

abstract class AsyncCubit<T> extends Cubit<AsyncState<T>> {
  AsyncCubit() : super(const AsyncState.initial());

  /// Execute an async operation with automatic state management
  Future<void> execute(Future<T> Function() operation) async {
    emit(const AsyncState.loading());

    final result = await operation();
    emit(AsyncState.success(result));
  }

  // ignore: unintended_html_in_doc_comment
  /// Execute operation that returns Either<Failure, T>>
  Future<void> executeEither(
    Future<Either<Failure, T>> Function() operation,
  ) async {
    emit(const AsyncState.loading());

    final result = await operation();
    result.fold(
      (failure) => emit(AsyncState.failure(failure: failure)),
      (data) => emit(AsyncState.success(data)),
    );
  }

  /// Reset to initial state
  void reset() => emit(const AsyncState.initial());

  /// Get current data if available
  T? get currentData => state.dataOrNull;

  /// Check if currently loading
  bool get isLoading => state.isLoading;

  /// Check if has error
  bool get hasError => state.isError;

  /// Get failure message if any
  String? get failureMessage {
    final failure = state.maybeWhen(
      failure: (failure) => failure,
      orElse: () => null,
    );
    return failure is Failure ? failure.message : failure?.toString();
  }
}
