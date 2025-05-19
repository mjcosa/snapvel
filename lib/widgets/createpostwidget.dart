import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDesignStyles {
  static const Color primaryColor = Color(0xFF1F214D);
  static const Color accentColor = Color(0xFFFFBD69);
  static const Color backgroundColor = Colors.white;
  static const Color greyBackground = Color(0xFFF6F6F6);
  static const Color textPrimary = Color(0xFF1F214D);
  static const Color textSecondary = Color(0xFF676767);
  static const Color iconGrey = Color(0xFF898A8D);

  static TextStyle get titleStyle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: textPrimary,
      );

  static TextStyle get subtitleStyle => GoogleFonts.inter(
        fontSize: 12,
        color: textSecondary,
      );

  static TextStyle get buttonTextStyle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle get navLabelStyle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  static const double maxContentWidth = 385;
  static const double defaultPadding = 20;
  static const double borderRadius = 12;
}
