import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../data/data.dart';
import '../exceptions/exceptions.dart';

class HttpClientService {
  final _url = 'http://192.168.15.25:8080/ports';

  final Client client;

  HttpClientService({required this.client});

  Future<RequestResult<List<dynamic>>> get() async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    Response response;
    try {
      response = await client.get(Uri.parse(_url), headers: headers);
    } on Exception catch (e) {
      if (e is TimeoutException) return RequestResult.error(HttpServiceException(e.message ?? 'Time out excedido'));

      return RequestResult.error(HttpServiceException(e.toString()));
    } finally {
      // client.close();
    }

    final responseBody = jsonDecode(response.body) as List<dynamic>;

    return switch (response.statusCode) {
      200 || 201 => RequestResult.nullableData(responseBody),
      204 => RequestResult.nullableData(null),
      400 => RequestResult.error(HttpServiceException(HttpExceptionCode.badRequest.statusCode)),
      401 => RequestResult.error(HttpServiceException(HttpExceptionCode.unauthorized.statusCode)),
      403 => RequestResult.error(HttpServiceException(HttpExceptionCode.forbidden.statusCode)),
      404 => RequestResult.error(HttpServiceException(HttpExceptionCode.notFound.statusCode)),
      _ => RequestResult.error(HttpServiceException(HttpExceptionCode.serverError.statusCode)),
    };
  }
}
