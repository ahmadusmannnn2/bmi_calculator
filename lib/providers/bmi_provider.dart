import 'package:flutter/material.dart';
import '../models/bmi_history.dart';

class BMIProvider extends ChangeNotifier {
  final List<BMIHistory> _history = [];
  ThemeMode _themeMode = ThemeMode.light;

  // Mendapatkan riwayat BMI
  List<BMIHistory> get history => _history;

  // Mendapatkan mode tema
  ThemeMode get themeMode => _themeMode;

  // Menambahkan riwayat BMI
  void addBMIHistory(double bmi, String status) {
    _history.add(BMIHistory(
      bmi: bmi,
      status: status,
      date: DateTime.now(),
    ));
    notifyListeners();
  }

  // Mengubah tema
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
