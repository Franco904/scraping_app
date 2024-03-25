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
    await Future.delayed(const Duration(milliseconds: 150));

    final requestResult = await httpClientService.get();
    if (requestResult.hasError) {
      Get.snackbar('Erro na comunicação com o servidor', '');
    }

    _ports.value = requestResult.hasData ? requestResult.data.map((data) => Port.fromJson(data)).toList() : [];
    _isLoading.value = false;
  }
}
