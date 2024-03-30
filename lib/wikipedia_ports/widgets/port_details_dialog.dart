import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class PortDetailsDialog extends StatelessWidget {
  final PortItem portItem;

  const PortDetailsDialog({
    Key? key,
    required this.portItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Detalhes da porta'),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _PortDetail(icon: Icons.label_outline, label: 'Porta', value: portItem.number),
            const SizedBox(height: 16),
            _PortDetail(icon: Icons.notes, label: 'Descrição', value: portItem.description),
            const SizedBox(height: 16),
            _PortDetail(icon: Icons.circle_outlined, label: 'Status', value: portItem.status),
          ],
        ),
      ),
      actions: [
        Wrap(
          children: [
            TextButton(
              onPressed: Get.back,
              child: const Text('Fechar'),
            ),
          ],
        ),
      ],
    );
  }
}

class _PortDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PortDetail({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.indigo),
            const SizedBox(width: 10),
            Text(label, style: Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 8),
        Align(alignment: Alignment.topLeft, child: Text(value)),
      ],
    );
  }
}
