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
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                Obx(() {
                  return controller.isLoading
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 48),
                          child: CircularProgressIndicator(color: Colors.indigo),
                        ))
                      : Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: constraints.maxWidth * 0.25,
                            ),
                            itemCount: controller.ports.length,
                            itemBuilder: (_, i) {
                              final port = controller.ports[i];
                              return GestureDetector(
                                child: Center(
                                  child: Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        port.number,
                                        style: Get.textTheme.titleLarge,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () => Get.dialog(PortDetailsDialog(
                                  portItem: PortItem.fromPort(port),
                                )),
                              );
                            },
                          ),
                        );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Column(
//                           children: controller.ports.map((port) {
//                             return Container(
//                               decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
//                               child: ListTile(
//                                 title: Text(port.number),
//                                 subtitle: Text(port.description),
//                                 trailing: Text(port.status),
//                                 tileColor: Colors.grey[200],
//                                 onTap: () => Get.dialog(PortDetailsDialog(
//                                   portItem: PortItem.fromPort(port),
//                                 )),
//                               ),
//                             );
//                           }).toList(),
//                         );
