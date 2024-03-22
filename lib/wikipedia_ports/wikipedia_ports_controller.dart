import 'package:get/get.dart';

class WikipediaPortsController extends GetxController {
  final RxString _greetingText = RxString('Hello world!');
  String get greetingText => _greetingText.value;
}
