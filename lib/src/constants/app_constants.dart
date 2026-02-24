import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColours {
  // Core Brand Colors
  static const Color primary = Color(0xFF2563EB); // Royal Blue
  static const Color primaryDark = Color(0xFF1E40AF); // Deep Blue
  static const Color primaryLight = Color(0xFF60A5FA); // Light Blue

  static const Color secondary = Color(0xFF0F172A); // Slate 900
  static const Color accent = Color(0xFFF59E0B); // Amber 500

  // Backgrounds
  static const Color background = Color(0xFF020617); // Premium Deep Dark
  static const Color surface = Color(0xFF0F172A); // Dark Slate for cards
  static const Color surfaceLight = Color(
    0xFF1E293B,
  ); // Lighter Slate for hover/active states

  // Glassmorphism
  static const Color glassWhite = Color(0x1AFFFFFF); // 10% White
  static const Color glassBlack = Color(0x80000000); // 50% Black

  // Text
  static const Color textPrimary = Color(0xFFF8FAFC); // Slate 50
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color textTertiary = Color(0xFF64748B); // Slate 500

  // Status
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF22C55E);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF4F46E5)], // Blue to Indigo
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [background, Color(0xFF0F172A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [Color(0x1AFFFFFF), Color(0x0DFFFFFF)], // White 10% to White 5%
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppBreakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double laptop = 1200;
  static const double tv = 1920;
}

class AppTextStyle {
  static TextStyle get h1 => GoogleFonts.outfit(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    color: AppColours.textPrimary,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static TextStyle get h2 => GoogleFonts.outfit(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: AppColours.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle get h3 => GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColours.textPrimary,
    height: 1.3,
  );

  static TextStyle get h4 => GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColours.textPrimary,
    height: 1.4,
  );

  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColours.textSecondary,
    height: 1.6,
  );

  static TextStyle get body => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColours.textSecondary,
    height: 1.6,
  );

  static TextStyle get button => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle get navLink => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColours.textSecondary,
    letterSpacing: 0.3,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColours.textTertiary,
    height: 1.5,
  );
}
