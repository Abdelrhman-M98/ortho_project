import 'package:dio/dio.dart';

sealed class Result<S extends Response, F extends DioException,
    E extends Exception> {
  const Result();
}

final class Success<S extends Response, F extends DioException,
    E extends Exception> extends Result<S, F, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S extends Response, F extends DioException,
    E extends Exception> extends Result<S, F, E> {
  const Failure(this.failure);
  final F failure;
}

final class Error<S extends Response, F extends DioException,
    E extends Exception> extends Result<S, F, E> {
  const Error(this.exception);
  final E exception;
}
