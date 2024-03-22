import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:scraping_app/infra/http_client_service.dart';

class GlobalDependencies extends Bindings {
  @override
  void dependencies() {
    // Infra services
    Get.put(HttpClientService(client: Client()));
  }
}
