import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/services/splash/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices = SplashServices();

  final Shader linearGradient =const LinearGradient(
    colors: <Color>[AppColors.titleTextGradient1, AppColors.titleTextGradient2],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 70.0));


  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppLocalizations.of(context)!.appTitle,style: GoogleFonts.charmonman(foreground: Paint()..shader = linearGradient,fontSize: 35,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
