import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wikipedia_ports.dart';

class WikipediaPortsPage extends GetView<WikipediaPortsController> {
  const WikipediaPortsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scraping')),
      body: Center(
        child: Text(controller.greetingText),
      ),
    );
  }
}
