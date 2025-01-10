import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bmi_provider.dart';

class BMIHistoryScreen extends StatelessWidget {
  const BMIHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiHistory = Provider.of<BMIProvider>(context).history;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat BMI')),
      body: bmiHistory.isEmpty
          ? const Center(child: Text('Belum ada riwayat BMI.'))
          : ListView.builder(
              itemCount: bmiHistory.length,
              itemBuilder: (context, index) {
                final record = bmiHistory[index];
                return ListTile(
                  title: Text('BMI: ${record.bmi.toStringAsFixed(2)}'),
                  subtitle: Text(
                    'Status: ${record.status}\nTanggal: ${record.date.toLocal()}',
                  ),
                );
              },
            ),
    );
  }
}
