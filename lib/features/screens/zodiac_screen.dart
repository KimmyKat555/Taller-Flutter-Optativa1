import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ZodiacScreen extends StatelessWidget {
  const ZodiacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zodiac Sign')),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Pantalla de signo zodiacal'),
      ),
    );
  }
}