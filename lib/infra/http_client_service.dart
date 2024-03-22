import 'package:http/http.dart';

class HttpClientService {
  final Client client;

  HttpClientService({required this.client});

  Future<String> request({
    required String url,
    required String method,
  }) async {
    final response = await client.get(Uri.parse(url));

    return response.toString();
  }
}
