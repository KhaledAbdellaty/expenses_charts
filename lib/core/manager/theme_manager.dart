import 'package:flutter/material.dart';

import 'color_manager.dart';

class ThemeManager {
  static final theme = ThemeData(
    // Font family
    fontFamily: "Lato",
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
    ),
    // [Focus Color ... Hover Color]
    focusColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    // Text Theme
    textTheme: const TextTheme(
      // Headline
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: "Lato"),
      headlineMedium: TextStyle(
        color: ColorManager.darkblue,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: ColorManager.placeHolder,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      // Title
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: ColorManager.greyBlue,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      // Body
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.grey,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
                           
      ),
      bodySmall: TextStyle(
        color: ColorManager.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
