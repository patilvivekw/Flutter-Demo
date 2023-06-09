import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF0A0E21),
            secondary: Colors.purple,
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}
