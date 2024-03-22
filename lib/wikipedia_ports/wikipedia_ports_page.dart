import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wikipedia_ports.dart';

class WikipediaPortsPage extends GetView<WikipediaPortsController> {
  static const String route = '/wikipedia_ports';

  const WikipediaPortsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia List of Ports'),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: Text(controller.greetingText),
      ),
    );
  }
}
