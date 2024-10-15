import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'themes.dart';


ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
  colorScheme: ThemeData.light().colorScheme.copyWith(
      secondary: const Color(0xffffffff),
      primary: const Color(0xffF47216),
      onPrimary: const Color(0xff000000),
      outline: const Color(0xffFCFCFC),
      onBackground: const Color(0xffF5F5F5),
      background: const Color(0xffffffff),
      primaryContainer: Colors.white,
      onPrimaryContainer: const Color(0xffF5F5F5)),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(linearTrackColor: Color(0xffECEAEA), color: ThemeConfig.primaryColor),
  primaryColor: ThemeConfig.primaryColor,
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
          (states) => Colors.black.withOpacity(.4),
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
    titleMedium: const TextStyle(
        fontFamily: "Mona Sans",
        color: Colors.black),
    titleSmall:   TextStyle(
      fontFamily: "Mona Sans",
      color: Colors.black,
    ),
    displayLarge: const TextStyle(
      fontFamily: "Mona Sans",
      color: Colors.black,
    ),
    displayMedium: const TextStyle(
      fontFamily: "Mona Sans",
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: const TextStyle(
      fontFamily: "Mona Sans",
      color: ThemeConfig.textColor636363,
    ),
    displaySmall: const TextStyle(
      fontFamily: "Mona Sans",
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: const TextStyle(
      fontFamily: "Mona Sans",
      color: ThemeConfig.textColor636363,
    ),
  ),
);
