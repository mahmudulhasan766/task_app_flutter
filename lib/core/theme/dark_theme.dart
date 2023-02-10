import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: const Color(0xFFE6EEFA),
  primaryColorLight: const Color(0xFFFFFFFF),
  primaryColorDark: const Color(0xFF10324A),
  secondaryHeaderColor: const Color(0xFF9BB8DA),
  disabledColor: const Color(0xFF8797AB),
  scaffoldBackgroundColor: const Color(0xFF151515),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFC0BFBF),
  focusColor: const Color(0xFF484848),
  hoverColor: const Color(0x400461A5),
  shadowColor: const Color(0x33e2f1ff),
  cardColor: const Color(0xFF10324A),
  colorScheme: const ColorScheme.dark(
      primary: Color(0xFF056AB4),
      secondary: Color(0xFFf57d00),
      error: Color(0xFFFF6767),
      tertiary: Color(0xFFFF6767),
      onPrimary: Color(0xff1c3c5d),
      background:  Color(0xff010D15)
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFFFFFFF)
      )
  ),
);

// semi-dark-light-color