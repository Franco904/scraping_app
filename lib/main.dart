import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_app/di/global_dependencies.dart';

import 'routes/routes.dart';
import 'wikipedia_ports/wikipedia_ports.dart';

void main() {
  runApp(const ScrapingApp());
}

class ScrapingApp extends StatelessWidget {
  const ScrapingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Scraping App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: WikipediaPortsPage.route,
      initialBinding: GlobalDependencies(),
      getPages: getAppPages(),
      debugShowCheckedModeBanner: false,
    );
  }
}
