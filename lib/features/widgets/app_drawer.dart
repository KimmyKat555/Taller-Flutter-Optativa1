import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Taller Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Navegación principal',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              context.pop();
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('Calcular Edad'),
            onTap: () {
              context.pop();
              context.go('/age');
            },
          ),
          ListTile(
            leading: const Icon(Icons.monitor_weight),
            title: const Text('Calcular IMC'),
            onTap: () {
              context.pop();
              context.go('/bmi');
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: const Text('Signo Zodiacal'),
            onTap: () {
              context.pop();
              context.go('/zodiac');
            },
          ),
        ],
      ),
    );
  }
}