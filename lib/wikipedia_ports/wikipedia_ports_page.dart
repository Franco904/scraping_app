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
        title: const Text('Wikipedia'),
        backgroundColor: Colors.grey[200],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            const Text('Lista de portas reservadas TCP/IP'),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(Icons.sync, color: Colors.indigo),
              label: const Text('Receber dados', style: TextStyle(color: Colors.indigo)),
              onPressed: () => controller.getPorts(),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Divider(),
            ),
            const SizedBox(height: 16),
            Obx(() {
              return controller.isLoading
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: CircularProgressIndicator(),
                    ))
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: controller.ports.map((port) {
                        return Flexible(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Row(
                              children: [
                                Text(port.number),
                                const SizedBox(width: 16),
                                Text(port.description),
                                const SizedBox(width: 16),
                                Text(port.status),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
