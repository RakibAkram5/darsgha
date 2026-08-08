import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Use system default font to avoid issues if custom font is not loaded
  static const String? fontFamily = null;

  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Dark Mode Text Styles
  static TextStyle darkH1 = h1.copyWith(color: AppColors.darkTextPrimary);
  static TextStyle darkBodyLarge = bodyLarge.copyWith(
    color: AppColors.darkTextPrimary,
  );
  static TextStyle darkBodyMedium = bodyMedium.copyWith(
    color: AppColors.darkTextSecondary,
  );

  // Light Mode Text Styles
  static TextStyle lightH1 = h1.copyWith(color: AppColors.lightTextPrimary);
  static TextStyle lightBodyLarge = bodyLarge.copyWith(
    color: AppColors.lightTextPrimary,
  );
  static TextStyle lightBodyMedium = bodyMedium.copyWith(
    color: AppColors.lightTextSecondary,
  );
}
