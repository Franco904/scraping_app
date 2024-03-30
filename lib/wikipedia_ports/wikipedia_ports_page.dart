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
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text('Lista de portas reservadas TCP/IP'),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.sync, color: Colors.indigo),
                      label: const Text('Receber dados', style: TextStyle(color: Colors.indigo)),
                      onPressed: () => controller.getPorts(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Obx(() {
                  return controller.isLoading
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 48),
                          child: CircularProgressIndicator(),
                        ))
                      : Column(
                          children: controller.ports.map((port) {
                            return Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                              child: ListTile(
                                title: Text(port.number),
                                subtitle: Text(port.description),
                                trailing: Text(port.status),
                                tileColor: Colors.grey[200],
                                onTap: () => Get.dialog(PortDetailsDialog(
                                  portItem: PortItem.fromPort(port),
                                )),
                              ),
                            );
                          }).toList(),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
