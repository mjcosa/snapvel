import 'package:flutter/material.dart';

class EditProfileStyles {
  // Colors
  static const Color backButtonColor = Color(0xFFECF0F4);
  static const Color profilePicColor = Color(0xFFFFC6AE);
  static const Color editButtonColor = Color(0xFFFF7622);
  static const Color inputBackgroundColor = Color(0xFFF0F5FA);
  static const Color labelColor = Color(0xFF32343E);
  static const Color inputTextColor = Color(0xFF6B6E82);
  static const Color saveButtonColor = Color(0xFFFFBD69);

  // Text Styles
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 17,
    color: Color(0xFF181C2E),
    fontFamily: 'Sen',
  );

  static const TextStyle labelStyle = TextStyle(
    fontSize: 14,
    color: labelColor,
    fontFamily: 'Sen',
  );

  // Input Decoration
  static final InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: inputBackgroundColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );

  // Button Style
  static final ButtonStyle saveButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: saveButtonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0,
  );
}