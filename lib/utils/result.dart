sealed class Result<T> {
  const Result();

  factory Result.ok(T data) = Ok<T>;
  factory Result.error(Object error) = Error<T>;

  bool get isOk => this is Ok<T>;
  bool get isError => this is Error<T>;

  R when<R>({
    required R Function(T data) ok,
    required R Function(Object error) error,
  }) {
    if (this is Ok<T>) {
      return ok((this as Ok<T>).data);
    } else if (this is Error<T>) {
      return error((this as Error<T>).error);
    }
    throw Exception('Unhandled Result type');
  }
}

final class Ok<T> extends Result<T> {
  final T data;

  const Ok(this.data);
}

final class Error<T> extends Result<T> {
  final Object error;

  const Error(this.error);
}