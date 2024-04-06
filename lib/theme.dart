import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: const Color(0xFFFFFFFF),
  primaryColorLight: const Color(0xFFE44B55),
  primaryColorDark: const Color(0xFF23B099),
  shadowColor: const Color(0xFFBF3B35),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      color: Color(0xFF111111),
    ),
    headlineSmall: TextStyle(
      fontSize: 14,
      color: Color(0xFF4B4B4B),
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: Color(0xFF9D9D9D),
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: Color(0xFFCFCFCF),
    ),
  ),
);
