import 'package:flutter/material.dart';
import 'package:simple_planner/screens/home_screen.dart';
import 'package:simple_planner/theme/app_theme.dart';

void main() {
  runApp(const SimplePlannerApp());
}

class SimplePlannerApp extends StatelessWidget {
  const SimplePlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
