import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import '../color/color.dart';

class InterNetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;

  const InterNetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off,
                color: AppColors.primaryColor,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Text('${AppLocalizations.of(context)!.connectionErrorText1}\n${AppLocalizations.of(context)!.connectionErrorText2}\n${AppLocalizations.of(context)!.connectionErrorText3}.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .15),
              CustomButton(
                title: AppLocalizations.of(context)!.retry ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}