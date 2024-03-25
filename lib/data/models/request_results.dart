import '../../exceptions/exceptions.dart';

class RequestResult<T> {
  T get data => throw UnimplementedError();

  AppException get error => throw UnimplementedError();

  RequestResult._();

  factory RequestResult.nullableData(T? data) => data != null ? _DataResult(data) : _NullResult();

  factory RequestResult.error(AppException error) => _ErrorResult(error);

  bool get hasData => false;

  bool get hasError => false;
}

class _NullResult<T> extends RequestResult<T> {
  _NullResult() : super._();
}

class _DataResult<T> extends RequestResult<T> {
  @override
  final T data;

  _DataResult(this.data) : super._();

  @override
  bool get hasData => true;
}

class _ErrorResult<T> extends RequestResult<T> {
  @override
  final AppException error;

  _ErrorResult(this.error) : super._();

  @override
  bool get hasError => true;
}
