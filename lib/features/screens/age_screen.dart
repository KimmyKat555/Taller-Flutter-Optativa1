import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _birthDate;
  int? _age;

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      int calculatedAge = now.year - picked.year;
      final hadBirthdayThisYear =
          (now.month > picked.month) ||
          (now.month == picked.month && now.day >= picked.day);

      if (!hadBirthdayThisYear) {
        calculatedAge--;
      }

      setState(() {
        _birthDate = picked;
        _age = calculatedAge;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _birthDate == null
        ? 'Ninguna fecha seleccionada'
        : '${_birthDate!.day.toString().padLeft(2, '0')}/'
            '${_birthDate!.month.toString().padLeft(2, '0')}/'
            '${_birthDate!.year}';

    return Scaffold(
      appBar: AppBar(title: const Text('Calcular Edad')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fecha de nacimiento: $formattedDate',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickBirthDate,
              icon: const Icon(Icons.calendar_today),
              label: const Text('Seleccionar fecha'),
            ),
            const SizedBox(height: 28),
            if (_age != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Tienes $_age ${_age == 1 ? 'año' : 'años'}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}