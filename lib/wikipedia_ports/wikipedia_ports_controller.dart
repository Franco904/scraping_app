import 'package:get/get.dart';
import 'package:scraping_app/infra/http_client_service.dart';

class WikipediaPortsController extends GetxController {
  final HttpClientService httpClientService = Get.find();

  final RxString _greetingText = RxString('Hello world!');
  String get greetingText => _greetingText.value;
}
