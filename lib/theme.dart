import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData getTheme() {
  return ThemeData(
    textTheme: _createTextTheme(),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      contentTextStyle: Get.textTheme.bodyLarge,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    ),
  );
}

TextTheme _createTextTheme() {
  const color = Colors.black87;

  return const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 96, color: color),
    displayMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 60, color: color),
    displaySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 32, color: color),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: color),
    headlineSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: color),
    titleLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: color),
    titleMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: color),
    titleSmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: color),
    bodyLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: color),
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: color),
    bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: color),
    labelSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: color),
  );
}
