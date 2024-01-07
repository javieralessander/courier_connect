import 'package:flutter/material.dart';

class AppTheme {
  static const Color devtoPrimary = Color(0xff508CD6);
  static const Color devtoSecondary = Color(0xffCDB7B3);
  static const Color devtoBackgroundColor = Color(0xff282929);
  static const Color devtoCanvasColors = Color(0xff168E7C);

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: devtoPrimary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
      ));
}
