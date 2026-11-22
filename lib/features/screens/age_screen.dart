import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AgeScreen extends StatelessWidget {
  const AgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Age Calculator')),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Pantalla de cálculo de edad'),
      ),
    );
  }
}