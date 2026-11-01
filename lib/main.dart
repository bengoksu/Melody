import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MelodyApp());
}

class MelodyApp extends StatelessWidget {
  const MelodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFD9B779);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melody',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF141414),
        colorScheme: ColorScheme.fromSeed(
          seedColor: gold,
          brightness: Brightness.dark,
          surface: const Color(0xFF252525),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
