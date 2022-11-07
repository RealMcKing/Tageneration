import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get dartTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF191919),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        enableFeedback: false,
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFCDD2DE),
          size: 24,
        ),
        selectedIconTheme: IconThemeData(
          size: 30,
          color: Color(0xFFFD7F5F),
          shadows: [
            BoxShadow(
              color: Color(0xDEFD7F5F),
              spreadRadius: 15,
              blurRadius: 15,
              offset: Offset(-1, 0),
            ),
          ],
        ),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          backgroundColor: const Color(0xFFDC6847),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: const Color(0xFFDC6847),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF191919),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFFFFFFF),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        iconColor: const Color(0xFFA0A7BA),
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w300,
          fontSize: 18.0,
          color: const Color(0xFFA0A7BA),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        filled: true,
        fillColor: const Color(0xFF454545),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
  }
}
