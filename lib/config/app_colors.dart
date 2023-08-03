import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class LightColors {
  static const background = Color(0xFFFAF9F6);
  static const cardColor = Color(0xFFF9FAFE);
}

abstract class DarkColors {
  static const background = Color(0xFF1E232A);
  static const cardColor = Color(0xFF303334);
}

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFF007ACC);
  static const Color accentColor = Colors.black;
  static const Color textColorLight = Colors.white;
  static const Color textColorDark = Colors.black;
  static const textFaded = Color(0xFF9899A5);
  static final visualDensity = VisualDensity.adaptivePlatformDensity;
  // Add more colors as needed

  static IconData getIconData(bool isDarkMode) {
    return isDarkMode ? Icons.light_mode : Icons.dark_mode_sharp;
  }
}

class AppThemes {
  static ThemeData light() => ThemeData(
        textTheme: GoogleFonts.interTextTheme().apply(
            bodyColor: AppColors.textFaded,
            displayColor: AppColors.primaryColor),
        cardColor: LightColors.cardColor,
        visualDensity: AppColors.visualDensity,
        primaryTextTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textColorDark),
          bodySmall: TextStyle(color: AppColors.textFaded),
        ),
        scaffoldBackgroundColor: LightColors.background,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: AppColors.accentColor),
        iconTheme: const IconThemeData(
          color: DarkColors.background,
        ),
      );

  static ThemeData dark() => ThemeData(
      textTheme: GoogleFonts.interTextTheme()
          .apply(bodyColor: AppColors.textColorLight),
      visualDensity: AppColors.visualDensity,
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(color: AppColors.textColorLight),
      ),
      cardColor: DarkColors.cardColor,
      scaffoldBackgroundColor: DarkColors.background,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: AppColors.accentColor),
      iconTheme: const IconThemeData(color: LightColors.background));
}
