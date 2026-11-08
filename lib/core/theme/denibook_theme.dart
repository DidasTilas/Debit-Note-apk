import 'package:flutter/material.dart';

class DeniBookColors {
  static const Color black = Color(0xFF000000);
  static const Color darkBackground = Color(0xFF121212);
  static const Color surfaceCard = Color(0xFF1E1E1E);
  static const Color yellow = Color(0xFFFFD000);
  static const Color yellowLight = Color(0xFFFFC107);
  static const Color cream = Color(0xFFFFE1BE);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF9E9E9E);

  // Status Colors
  static const Color paid = Color(0xFF2ECC71);
  static const Color owing = Color(0xFFE67E22);
  static const Color overdue = Color(0xFFE74C3C);
}

class DeniBookTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: DeniBookColors.black,
      cardColor: DeniBookColors.surfaceCard,
      primaryColor: DeniBookColors.yellow,
      appBarTheme: const AppBarTheme(
        backgroundColor: DeniBookColors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: DeniBookColors.textWhite,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: DeniBookColors.yellow,
        surface: DeniBookColors.surfaceCard,
        background: DeniBookColors.black,
      ),
    );
  }
}
