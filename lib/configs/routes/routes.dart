
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/views/Alerts/alerts_screen.dart';
import 'package:kuruk_saarthi/views/dashboard/dashboard.dart';
import 'package:kuruk_saarthi/views/login/login_screen.dart';
import 'package:kuruk_saarthi/views/pin_change/pin_change.dart';
import 'package:kuruk_saarthi/views/region_select/region_select_screen.dart';
import 'package:kuruk_saarthi/views/splash/splash_view.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return PageTransition(child:const SplashView(), type: PageTransitionType.rightToLeft);

      case RoutesName.regionScreen:
        return PageTransition(child:const RegionSelectScreen(), type: PageTransitionType.rightToLeft);

      case RoutesName.login:
        return PageTransition(child:const LoginScreen(), type: PageTransitionType.rightToLeft);

      case RoutesName.dashboard:
        return PageTransition(child:const Dashboard(), type: PageTransitionType.rightToLeft);

      case RoutesName.chnagePin:
        return PageTransition(child:const PinChange(), type: PageTransitionType.rightToLeft);

      case RoutesName.alert:
        return PageTransition(child:const AlertsScreen(isBack: true,), type: PageTransitionType.rightToLeft);

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}