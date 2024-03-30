import '../../data/data.dart';

class PortItem {
  final String number;
  final String description;
  final String status;

  PortItem({
    required this.number,
    required this.description,
    required this.status,
  });

  factory PortItem.fromPort(Port port) {
    return PortItem(
      number: port.number,
      description: port.description,
      status: port.status,
    );
  }
}
