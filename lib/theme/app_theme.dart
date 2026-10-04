import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    colorSchemeSeed: Colors.indigo,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 1),
  );
}
