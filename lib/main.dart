import 'package:flutter/material.dart';

import 'wikipedia_ports/wikipedia_ports.dart';

void main() {
  runApp(const ScrapingApp());
}

class ScrapingApp extends StatelessWidget {
  const ScrapingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scraping App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WikipediaPortsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
