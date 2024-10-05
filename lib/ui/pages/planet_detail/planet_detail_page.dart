import 'package:flutter/material.dart';

class PlanetDetailPage extends StatelessWidget {
  const PlanetDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planet Detail')),
      body: const Center(child: Text('This is the Planet Detail Page')),
    );
  }
}
