import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.staatliches(
        fontSize: 84, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.staatliches(
        fontSize: 52, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3:
        GoogleFonts.staatliches(fontSize: 42, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.staatliches(
        fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5:
        GoogleFonts.staatliches(fontSize: 21, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.staatliches(
        fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: GoogleFonts.staatliches(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.staatliches(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.staatliches(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.staatliches(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.staatliches(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.staatliches(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.staatliches(
        fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.staatliches(
        fontSize: 84, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.staatliches(
        fontSize: 52, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3:
        GoogleFonts.staatliches(fontSize: 42, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.staatliches(
        fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5:
        GoogleFonts.staatliches(fontSize: 21, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.staatliches(
        fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: GoogleFonts.staatliches(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.staatliches(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.staatliches(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: GoogleFonts.staatliches(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: GoogleFonts.staatliches(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: GoogleFonts.staatliches(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.staatliches(
        fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  ).apply(
    bodyColor: GoogleTheme.lightColorScheme.onError,
    displayColor: GoogleTheme.lightColorScheme.onError,
  );

  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    surfaceTint: Color(0xFF6750A4),
    onErrorContainer: Color(0xFF410E0B),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onTertiaryContainer: Color(0xFF31111D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD8E4),
    tertiary: Color(0xFF7D5260),
    shadow: Color(0xFF000000),
    error: Color(0xFFB3261E),
    outline: Color(0xFF79747E),
    onBackground: Color(0xFF1C1B1F),
    background: Color(0xFFFFFBFE),
    onInverseSurface: Color(0xFFF4EFF4),
    inverseSurface: Color(0xFF313033),
    onSurfaceVariant: Color(0xFF49454F),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    surface: Color(0xFFFFFBFE),
    onSecondaryContainer: Color(0xFF1D192B),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE8DEF8),
    secondary: Color(0xFF625B71),
    inversePrimary: Color(0xFFD0BCFF),
    onPrimaryContainer: Color(0xFF21005D),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEADDFF),
    primary: Color(0xFF6750A4),
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    surfaceTint: Color(0xFFD0BCFF),
    onErrorContainer: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onTertiaryContainer: Color(0xFFFFD8E4),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    tertiary: Color(0xFFEFB8C8),
    shadow: Color(0xFF000000),
    error: Color(0xFFF2B8B5),
    outline: Color(0xFF938F99),
    onBackground: Color(0xFFE6E1E5),
    background: Color(0xFF1C1B1F),
    onInverseSurface: Color(0xFF313033),
    inverseSurface: Color(0xFFE6E1E5),
    onSurfaceVariant: Color(0xFFCAC4D0),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    surface: Color(0xFF1C1B1F),
    onSecondaryContainer: Color(0xFFE8DEF8),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    secondary: Color(0xFFCCC2DC),
    inversePrimary: Color(0xFF6750A4),
    onPrimaryContainer: Color(0xFFEADDFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    primary: Color(0xFFD0BCFF),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: GoogleTheme.lightColorScheme.background,
    textTheme: lightTextTheme,
    colorScheme: lightColorScheme,
  );

  static final darkTheme = ThemeData(
    // scaffoldBackgroundColor: GoogleTheme.lightColorScheme.onSurfaceVariant,
    scaffoldBackgroundColor: const Color(0xFF333333),
    textTheme: darkTextTheme,
    colorScheme: darkColorScheme,
  );
}
