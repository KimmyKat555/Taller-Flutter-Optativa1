import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ZodiacScreen extends StatefulWidget {
  const ZodiacScreen({super.key});

  @override
  State<ZodiacScreen> createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  DateTime? _selectedDate;
  String? _zodiacSign;

  String _getZodiacSign(int day, int month) {
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return 'Aries';
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return 'Tauro';
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return 'Géminis';
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return 'Cáncer';
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return 'Leo';
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return 'Virgo';
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return 'Libra';
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return 'Escorpio';
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return 'Sagitario';
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return 'Capricornio';
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return 'Acuario';
    } else {
      return 'Piscis';
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      final sign = _getZodiacSign(picked.day, picked.month);
      setState(() {
        _selectedDate = picked;
        _zodiacSign = sign;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _selectedDate == null
        ? 'Ninguna fecha seleccionada'
        : '${_selectedDate!.day.toString().padLeft(2, '0')}/'
            '${_selectedDate!.month.toString().padLeft(2, '0')}/'
            '${_selectedDate!.year}';

    return Scaffold(
      appBar: AppBar(title: const Text('Signo Zodiacal')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fecha seleccionada: $formattedDate',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Elegir fecha'),
            ),
            const SizedBox(height: 28),
            if (_zodiacSign != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Tu signo es: $_zodiacSign',
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