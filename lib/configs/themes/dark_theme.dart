import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';

import 'themes.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        toolbarTextStyle: ThemeData.light().textTheme.displayMedium!.copyWith(fontFamily: ThemeConfig.monaSansRegular, color: AppColors.whiteColor, fontWeight: FontWeight.w500),
        iconTheme: const IconThemeData(
          color: AppColors.whiteColor,
        )),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.whiteColor),
    textTheme: ThemeData.dark().textTheme.copyWith(
      titleMedium:const TextStyle(
        fontFamily: "Mona Sans",
        color: AppColors.blackColor
      ),
      titleSmall:const TextStyle(
          fontFamily: "Mona Sans",
         color: ThemeConfig.textColor636363,
      ),
      displayLarge:const TextStyle(
        fontFamily: "Mona Sans",
        color: AppColors.blackColor
      ),
      displayMedium:const TextStyle(
          fontFamily: "Mona Sans",
        color:  AppColors.secondaryTextColor,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium:const TextStyle(
        fontFamily: "Mona Sans",
        color:  ThemeConfig.textColor636363,
      ),
      displaySmall:const TextStyle(
        fontFamily: "Mona Sans",
        color:  ThemeConfig.textColor636363,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium:const TextStyle(
        fontFamily: "Mona Sans",
        color:  ThemeConfig.textColor636363,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(.3)),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
        secondary: const Color(0xff73777a),
        primary: Colors.white,
        onPrimary: const Color(0xffA0A0A0),
        outline: Colors.black,
        onBackground: const Color(0xff202934),
        brightness: Brightness.dark,
        background: const Color(0xff202934),
        primaryContainer: const Color(0xff2d3236),
        onPrimaryContainer: const Color(0xff5a5f62)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(linearTrackColor: Colors.white, color: ThemeConfig.primaryColor),
    primaryColor: ThemeConfig.primaryColor,
    scaffoldBackgroundColor: ThemeConfig.darkBackColor);