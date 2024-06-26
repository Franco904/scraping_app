enum HttpExceptionCode {
  ok('200'),
  created('201'),
  noContent('204'),
  badRequest('400'),
  unauthorized('401'),
  forbidden('403'),
  notFound('404'),
  serverError('500');

  final String statusCode;

  const HttpExceptionCode(this.statusCode);
}
