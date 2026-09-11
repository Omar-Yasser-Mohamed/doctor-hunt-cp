import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,

      surface: Colors.white,
      onSurface: AppColors.textMain,

      error: AppColors.danger,
      onError: Colors.white,
    ),

    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.textMain,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: AppColors.textSub.withValues(alpha: .16),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: AppColors.textSub.withValues(alpha: .16),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.danger,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.danger,
          width: 2,
        ),
      ),

      prefixIconColor: AppColors.textBorders,
      suffixIconColor: AppColors.textBorders,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primaryLight,
      selectionHandleColor: AppColors.primary,
    ),
  );
}