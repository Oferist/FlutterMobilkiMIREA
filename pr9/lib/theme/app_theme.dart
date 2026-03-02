// Здесь мы настроим кастомные цвета для светлой и тёмной темы

import 'package:flutter/material.dart';

class AppTheme {
  // --- Светлая тема ---
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue[800],
    scaffoldBackgroundColor: const Color(0xFFF5F7FA), // Светло-серый фон

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[800],
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    cardTheme: const CardThemeData(
      color: Colors.white,
      elevation: 4,
    ),

    colorScheme: ColorScheme.light(
      primary: Colors.blue[800]!,
      secondary: Colors.blueAccent,
      surface: Colors.white,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'serif',
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  // --- Тёмная тема ---
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A237E), // Глубокий синий
    scaffoldBackgroundColor: const Color(0xFF121212), // Почти черный фон

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    cardTheme: const CardThemeData(
      color: Color(0xFF2C2C2C), // Темно-серые карточки
      elevation: 4,
    ),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF536DFE),
      secondary: Colors.tealAccent,
      surface: Color(0xFF1E1E1E),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'serif',
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(color: Colors.white70),
      bodyMedium: TextStyle(color: Colors.white70),
    ),

    // Настройка навигационной панели для темной темы
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF1F1F1F),
      indicatorColor: Colors.blue[900],
      iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white70)),
    ),
  );
}