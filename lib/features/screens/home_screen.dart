import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido a esta app calculadora',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecciona una herramienta desde aquí o abre el menú lateral:',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.cake),
                title: const Text('Calcular Edad'),
                subtitle: const Text('Calcula tu edad a partir de tu fecha de nacimiento'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/age'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.monitor_weight),
                title: const Text('Calcular IMC'),
                subtitle: const Text('Calcula tu Índice de Masa Corporal y clasificación'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/bmi'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.auto_awesome),
                title: const Text('Signo Zodiacal'),
                subtitle: const Text('Descubre tu signo zodiacal según tu fecha'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/zodiac'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}