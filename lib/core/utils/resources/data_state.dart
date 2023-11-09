import '../enums/states.dart';

abstract class DataState<T> {
  final States state;
  final T? data;
  final Exception? error;

  const DataState({
    required this.state,
    this.data,
    this.error,
  });

  @override
  int get hashCode => state.hashCode + data.hashCode;

  @override
  bool operator ==(Object other) =>
      other is DataState &&
      state == other.state &&
      data == other.data &&
      error.runtimeType == other.error.runtimeType;
}

class DataLoading<T> extends DataState<T> {
  const DataLoading()
      : super(
          state: States.loading,
        );
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data)
      : super(
          state: States.success,
          data: data,
        );
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(Exception error)
      : super(
          state: States.failure,
          error: error,
        );
}

class DataEmpty<T> extends DataState<T> {
  const DataEmpty()
      : super(
          state: States.empty,
        );
}
