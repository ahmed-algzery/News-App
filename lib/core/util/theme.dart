import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const MaterialColor customWhite = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(_whitePrimaryValue),
      600: Color(0xFFEEEEEE),
      700: Color(0xFFDDDDDD),
      800: Color(0xFFCCCCCC),
      900: Color(0xFFBBBBBB),
    },
  );

  static const int _whitePrimaryValue = 0xFFFFFFFF;

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: customWhite, brightness: Brightness.light)
        .copyWith(secondary: Colors.blue),
    textTheme: GoogleFonts.openSansTextTheme(),
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.indigo, brightness: Brightness.dark)
        .copyWith(secondary: Colors.indigo),
    textTheme: GoogleFonts.openSansTextTheme().apply(bodyColor: Colors.white),
    brightness: Brightness.dark,
  );
}
