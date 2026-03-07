import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  // Primary – Deep Teal
  static const Color primary = Color(0xFF005F6B);
  static const Color primaryLight = Color(0xFF337F8A);
  static const Color primaryDark = Color(0xFF003F47);

  // Accent – Warm Amber
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFD97706);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F1923);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1A2535);
  static const Color cardDark = Color(0xFF243044);

  // Text
  static const Color textPrimaryLight = Color(0xFF1E293B);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Category Colors (for diagnosis)
  static const Color financeColor = Color(0xFF6366F1);
  static const Color marketingColor = Color(0xFFEC4899);
  static const Color hrColor = Color(0xFF14B8A6);
  static const Color operationsColor = Color(0xFFF97316);
  static const Color governanceColor = Color(0xFF8B5CF6);

  // Chart Colors
  static const List<Color> chartPalette = [
    Color(0xFF005F6B),
    Color(0xFFF59E0B),
    Color(0xFF10B981),
    Color(0xFF6366F1),
    Color(0xFFEC4899),
  ];
}

class AppSpacing {
  AppSpacing._();
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

class AppRadius {
  AppRadius._();
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double full = 999.0;
}

class AppTheme {
  AppTheme._();

  static TextTheme _buildTextTheme(Color primary, Color secondary) {
    return GoogleFonts.nunitoTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primary,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: primary,
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
      labelLarge: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: AppColors.primaryLight,
      secondary: AppColors.accent,
      onSecondary: Colors.white,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textPrimaryLight,
      error: AppColors.error,
      outline: const Color(0xFFE2E8F0),
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: _buildTextTheme(
      AppColors.textPrimaryLight,
      AppColors.textSecondaryLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.surfaceLight,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF1F5F9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      labelStyle: GoogleFonts.nunito(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      indicatorColor: AppColors.primary.withValues(alpha: 0.15),
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w600),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE2E8F0),
      thickness: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryLight,
      onPrimary: Colors.white,
      secondary: AppColors.accentLight,
      onSecondary: Colors.black,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      error: AppColors.error,
      outline: const Color(0xFF2D3B4E),
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: _buildTextTheme(
      AppColors.textPrimaryDark,
      AppColors.textSecondaryDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: const BorderSide(color: Color(0xFF2D3B4E)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: Color(0xFF2D3B4E)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      indicatorColor: AppColors.primaryLight.withValues(alpha: 0.2),
      labelTextStyle: WidgetStateProperty.all(
        GoogleFonts.nunito(fontSize: 11, fontWeight: FontWeight.w600),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF2D3B4E),
      thickness: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.cardDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    ),
  );
}
