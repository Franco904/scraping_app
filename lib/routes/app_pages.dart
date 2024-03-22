import 'package:get/get.dart';
import 'package:scraping_app/wikipedia_ports/wikipedia_ports.dart';

List<GetPage> getAppPages() => [
      GetPage(
        name: WikipediaPortsPage.route,
        page: () => const WikipediaPortsPage(),
        binding: BindingsBuilder(() => Get.lazyPut(() => WikipediaPortsController(), fenix: true)),
      )
    ];
