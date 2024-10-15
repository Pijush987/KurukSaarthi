import 'package:flutter/material.dart';

class Constant{
  static String pin = "";
  static String appTittle = 'KurukSaarthi';
  static String appVersion = 'v1.0.0';
  static String welcomeMessage = 'नमस्कार, प्रिय मतदाता';

  static double sideHorizontalPadding = 14;
  static String  privetKey = "CPU0-G8JN-514G-YF6L-RW1I-TA4I";

  static ValueNotifier<int> countListinear = ValueNotifier<int>(0);
  static ValueNotifier<String> loading = ValueNotifier<String>("Stop");


}
 ValueNotifier<String> notificationNotifier = ValueNotifier<String>("");
 ValueNotifier<bool> isDataSync = ValueNotifier<bool>(false);
