import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double? _bmi;
  String? _category;
  String? _errorMessage;

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculateBmi() {
    final weightText = _weightController.text.trim().replaceAll(',', '.');
    final heightText = _heightController.text.trim().replaceAll(',', '.');

    final double? weight = double.tryParse(weightText);
    double? height = double.tryParse(heightText);

    if (weight == null || height == null || weight <= 0 || height <= 0) {
      setState(() {
        _bmi = null;
        _category = null;
        _errorMessage = 'Ingresa un peso y una estatura válidos mayores a 0.';
      });
      return;
    }

    if (height > 3) {
      height = height / 100;
    }

    final double bmiValue = weight / (height * height);
    String categoryText;

    if (bmiValue < 18.5) {
      categoryText = 'Bajo peso';
    } else if (bmiValue < 25) {
      categoryText = 'Peso normal';
    } else if (bmiValue < 30) {
      categoryText = 'Sobrepeso';
    } else {
      categoryText = 'Obesidad';
    }

    setState(() {
      _bmi = bmiValue;
      _category = categoryText;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular IMC')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                hintText: 'Ej. 60',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _heightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Estatura (m o cm)',
                hintText: 'Ej. 1.65 o 165',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBmi,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
            if (_bmi != null && _category != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'IMC: ${_bmi!.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Clasificación: $_category',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}