
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuruk_saarthi/bloc/login_bloc/login_bloc.dart';
import 'package:kuruk_saarthi/bloc/region_select_bloc/region_select_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/login/widgets/login_input_widget.dart';
import 'package:kuruk_saarthi/views/login/widgets/login_button.dart';
import 'package:kuruk_saarthi/views/region_select/widgets/continue_button.dart';
import 'package:kuruk_saarthi/views/region_select/widgets/region_dopdown_widget.dart';

class RegionSelectScreen extends StatefulWidget {
  const RegionSelectScreen({super.key});

  @override
  State<RegionSelectScreen> createState() => _RegionSelectScreenState();
}

class _RegionSelectScreenState extends State<RegionSelectScreen> {

  final Shader linearGradient =const LinearGradient(
    colors: <Color>[AppColors.titleTextGradient1, AppColors.titleTextGradient2],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 70.0));

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: context.mediaQueryHeight,
            width: context.mediaQueryWidth,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: context.mediaQueryHeight*0.1),
                    Text(AppLocalizations.of(context)!.appTitle,style: GoogleFonts.charmonman(foreground: Paint()..shader = linearGradient,fontSize: 24,fontWeight: FontWeight.w600),),
                    SizedBox(height: context.mediaQueryHeight*0.007),
                    Text(Constant.appVersion,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.secondaryTextColor,fontSize: 14,fontWeight: FontWeight.w400)),
                    SizedBox(height: context.mediaQueryHeight*0.12),

                    // Text(AppLocalizations.of(context)!.helloDearVoters,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.blackColor,fontSize: 20,fontWeight: FontWeight.w600),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.selectVidhanSabhaRegion,style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.secondaryTextColor,fontSize: 16,fontWeight: FontWeight.w600),textAlign: TextAlign.start),
                            SizedBox(height: context.mediaQueryHeight*0.02),
                            RegionDropdownWidget(),
                            SizedBox(height: context.mediaQueryHeight*0.05),
                            ContinueButton(formKey: _formKey,)
                          ],
                        ),
                      ),
                    )

                  ],),
              ),
            ),
          ),
        )
    );
  }
}
