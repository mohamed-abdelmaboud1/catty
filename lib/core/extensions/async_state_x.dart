// Extension methods for convenience

import '../cubit/async_state.dart';

extension AsyncStateX<T> on AsyncState<T> {
  bool get isInitial => this is AsyncInitial<T>;
  bool get isLoading => this is AsyncLoading<T>;
  bool get isSuccess => this is AsyncSuccess<T>;
  bool get isError => this is AsyncFailure<T>;

  T? get dataOrNull => maybeWhen(
        success: (data) => data,
        orElse: () => null,
      );

  String? get errorMessage => maybeWhen(
        failure: (failure) => failure?.toString(),
        orElse: () => null,
      );

  dynamic get errorObject => maybeWhen(
        failure: (failure) => failure,
        orElse: () => null,
      );
}
