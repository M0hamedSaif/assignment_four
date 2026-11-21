import 'package:flutter/material.dart';

import 'app_colors.dart';

import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(width: 2, color: color),
  );
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBlue,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      surfaceTintColor:AppColors.transparent,
      elevation: 0,
      centerTitle: false,
    ),

    textTheme: GoogleFonts.interTextTheme(
      TextTheme(
        // Title Large -> 20, bold, gold
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.gold,
        ),
        // Title Medium -> 16, bold, gold
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.gold,
        ),
        // Body Small -> 10, regular, gold
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.gold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.darkBlue,
        overlayColor: AppColors.transparent,
        padding: const EdgeInsets.all(16),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.gold,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkBlue,
      contentPadding: const EdgeInsets.all(16),
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.lightBlue,
      ),
      enabledBorder: _border(AppColors.gold),
      focusedBorder: _border(AppColors.gold),
      errorBorder: _border(AppColors.red),
      focusedErrorBorder: _border(AppColors.red),
    ),
  );
}
