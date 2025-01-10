import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bmi_provider.dart';

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController weightController = TextEditingController();
    final TextEditingController heightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator BMI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Berat badan (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Tinggi badan (cm)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final weight = double.tryParse(weightController.text);
                final height = double.tryParse(heightController.text);
                if (weight == null || height == null || height <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Masukkan nilai berat dan tinggi dengan benar!'),
                    ),
                  );
                  return;
                }

                final bmi = weight / ((height / 100) * (height / 100));
                String status = '';
                if (bmi < 18.5) {
                  status = 'Kekurangan berat badan';
                } else if (bmi < 24.9) {
                  status = 'Normal';
                } else if (bmi < 29.9) {
                  status = 'Kelebihan berat badan';
                } else {
                  status = 'Obesitas';
                }

                Provider.of<BMIProvider>(context, listen: false)
                    .addBMIHistory(bmi, status);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Hasil BMI'),
                    content: Text(
                      'BMI Anda: ${bmi.toStringAsFixed(2)}\nStatus: $status',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Hitung BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
