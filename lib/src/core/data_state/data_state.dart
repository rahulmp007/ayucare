enum DataState {
  loading,
  success,
  error,
  initial;

  bool get isFetched => this == DataState.success;
  bool get isLoading => this == DataState.loading;
  bool get isFailed => this == DataState.error;
  bool get isInitial => this == DataState.initial;
}

sealed class Ds<T> {
  final DataState state;
  final String? error;
  final T? valueOrNull;

  const Ds({required this.state, this.error, this.valueOrNull});

  T? get value => valueOrNull;

  R onState<R>({
    required R Function(T data) success,
    required R Function(String error) onFailed,
    required R Function() onLoading,
    R Function()? onInitial,
  }) {
    switch (state) {
      case DataState.error:
        return onFailed(error ?? '');
      case DataState.success:
        return success(valueOrNull as T);
      case DataState.loading:
        return onLoading();
      case DataState.initial:
        return onInitial != null ? onInitial() : onLoading();
    }
  }
}

class Initial<T> extends Ds<T> {
  Initial() : super(state: DataState.initial);
}

class Loading<T> extends Ds<T> {
  Loading() : super(state: DataState.loading);
}

class Success<T> extends Ds<T> {
  final T data;
  Success({required this.data})
    : super(state: DataState.success, valueOrNull: data);
}

class Failed<T> extends Ds<T> {
  final String? e;
  Failed({this.e}) : super(state: DataState.error, error: e);
}
