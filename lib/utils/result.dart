sealed class Result<T> {
  const Result();

  factory Result.ok(T data) = Ok<T>;
  factory Result.failure(Object failure) = Failure<T>;

  bool get isOk => this is Ok<T>;
  bool get isfailure => this is Failure<T>;

  T get data {
    if (this is Ok<T>) {
      return (this as Ok<T>).data;
    }
    throw Exception('No data available for Failure result');
  }

  R when<R>({
    required R Function(T data) ok,
    required R Function(Object failure) failure,
  }) {
    if (this is Ok<T>) {
      return ok((this as Ok<T>).data);
    } else if (this is Failure<T>) {
      return failure((this as Failure<T>).failure);
    }
    throw Exception('Unhandled Result type');
  }
}

final class Ok<T> extends Result<T> {
  final T data;

  const Ok(this.data);
}

final class Failure<T> extends Result<T> {
  final Object failure;

  const Failure(this.failure);
}