class Port {
  final String number;
  final String description;
  final String status;

  Port({
    required this.number,
    required this.description,
    required this.status,
  });

  factory Port.fromJson(Map<String, dynamic> json) {
    return Port(
      number: normalizeChars(json['number'] as String),
      description: normalizeChars(json['description'] as String),
      status: normalizeChars(json['status'] as String),
    );
  }
}

String normalizeChars(String rawString) {
  return rawString.replaceAll('Ã§', 'ç').replaceAll('Ã¡', 'á').replaceAll('Ã£', 'ã').replaceAll('Ãª', 'ê');
}
