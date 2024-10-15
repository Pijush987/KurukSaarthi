import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionController().getUserFromPreference().then((value) async {
      log(SessionController.isLogin.toString());
      if (SessionController.isLogin ?? false) {
        Timer(
          const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.dashboard, (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
      );
    });
  }
}