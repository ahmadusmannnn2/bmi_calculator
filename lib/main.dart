import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/bmi_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BMIProvider(),
      child: Consumer<BMIProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            title: 'BMI Calculator',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: provider.themeMode, // Gunakan mode tema dari provider
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
