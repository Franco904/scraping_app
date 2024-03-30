import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wikipedia_ports.dart';

class WikipediaPortsPage extends StatelessWidget {
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
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const _PortsHeaderWidget(),
              const Divider().paddingSymmetric(horizontal: 16),
              const SizedBox(height: 16),
              _PortsSectionWidget(currentMaxScreenWidth: constraints.maxWidth),
            ],
          ).paddingSymmetric(horizontal: 16);
        },
      ),
    );
  }
}

class _PortsHeaderWidget extends GetView<WikipediaPortsController> {
  const _PortsHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        const Text('Lista de portas reservadas TCP/IP'),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          icon: const Icon(Icons.sync, color: Colors.indigo),
          label: const Text('Receber dados', style: TextStyle(color: Colors.indigo)),
          onPressed: () => controller.getPorts(),
        ).paddingSymmetric(horizontal: 20),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _PortsSectionWidget extends GetView<WikipediaPortsController> {
  final double currentMaxScreenWidth;

  const _PortsSectionWidget({
    Key? key,
    required this.currentMaxScreenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? Center(
              child: const CircularProgressIndicator(color: Colors.indigo).paddingOnly(top: 48),
            )
          : _PortsGridWidget(
              currentMaxScreenWidth: currentMaxScreenWidth,
            ).paddingOnly(left: 20, right: 20, bottom: 24);
    });
  }
}

class _PortsGridWidget extends GetView<WikipediaPortsController> {
  final double currentMaxScreenWidth;

  const _PortsGridWidget({
    Key? key,
    required this.currentMaxScreenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: currentMaxScreenWidth * 0.25,
      ),
      itemCount: controller.ports.length,
      itemBuilder: (_, i) {
        final port = controller.ports[i];
        return GestureDetector(
          child: _PortItemWidget(portNumber: port.number),
          onTap: () {
            Get.dialog(PortDetailsDialog(portItem: PortItem.fromPort(port)));
          },
        );
      },
    );
  }
}

class _PortItemWidget extends StatelessWidget {
  final String portNumber;

  const _PortItemWidget({Key? key, required this.portNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(portNumber, style: Get.textTheme.titleLarge),
        ),
      ),
    );
  }
}
