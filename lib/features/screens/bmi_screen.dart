import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Pantalla de índice de masa corporal'),
      ),
    );
  }
}