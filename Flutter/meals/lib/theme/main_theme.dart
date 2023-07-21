import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 131, 57, 0),
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }
}
