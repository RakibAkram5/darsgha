import 'package:flutter/material.dart';

class AppColors {
  // Official Brand Colors
  static const Color midnight = Color(0xFF070B1A);
  static const Color electricBlue = Color(0xFF4F7CFF);
  static const Color auroraViolet = Color(0xFF8B5CF6);
  static const Color cyberCyan = Color(0xFF22D3EE);
  static const Color softPink = Color(0xFFF472B6);

  // Brand Gradient
  static const LinearGradient brandGradient = LinearGradient(
    colors: [
      electricBlue,
      auroraViolet,
      cyberCyan,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF070B1A);
  static const Color darkSurface = Color(0xFF0F172A);
  static const Color darkCard = Color(0xFF131D33);
  static const Color darkElevated = Color(0xFF19243D);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // Light Mode Colors
  static const Color lightBackground = Color(0xFFF5F7FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF4169E1);
  static const Color lightViolet = Color(0xFF7C3AED);
  static const Color lightCyan = Color(0xFF0891B2);
  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightBorder = Color(0xFFE2E8F0);
}
