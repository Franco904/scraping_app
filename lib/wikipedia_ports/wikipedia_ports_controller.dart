import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:scraping_app/data/data.dart';
import 'package:scraping_app/infra/http_client_service.dart';

class WikipediaPortsController extends GetxController {
  final httpClientService = HttpClientService(client: Client());

  final _ports = Rx(<Port>[]);
  final _isLoading = RxBool(false);

  List<Port> get ports => _ports.value;
  bool get isLoading => _isLoading.value;

  Future<void> getPorts() async {
    _isLoading.value = true;

    final requestResult = await httpClientService.get();

    if (requestResult.hasError) {
      _isLoading.value = false;
      return _showErrorMessage('Erro na comunicação com o servidor');
    }

    _ports.value = requestResult.hasData ? requestResult.data.map((data) => Port.fromJson(data)).toList() : [];

    _isLoading.value = false;
  }

  void _showErrorMessage(String msg) {
    Get.rawSnackbar(
      messageText: Text(msg, style: const TextStyle(color: Colors.white)),
      borderRadius: 8,
      backgroundColor: Colors.black87,
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }
}
