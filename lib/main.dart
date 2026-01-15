import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CodelineApp());
}

class CodelineApp extends StatelessWidget {
  const CodelineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeline Premium Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColours.primary,
        scaffoldBackgroundColor: AppColours.background,
        useMaterial3: true,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: AppColours.primary,
          secondary: AppColours.accent,
          surface: AppColours.surface,
          error: AppColours.error,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: AppColours.textPrimary,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
