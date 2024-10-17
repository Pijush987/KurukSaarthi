import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoothInchragename extends StatelessWidget {
  const BoothInchragename({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        cursorColor: AppColors.secondaryTextColor,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 15,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 6),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 50,
              maxWidth: 50,
              minHeight: 18,
              minWidth: 18
          ),
          hintText:AppLocalizations.of(context)!.enterBoothInChargeName,
          hintStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 15,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.fieldBackgroundColor,width: 1.5)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.fieldBackgroundColor,width: 1.5)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.primaryColor,width: 1.5)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.primaryColor,width: 1.5)
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          print("object  $value");
          context.read<SurveysBloc>().add(BoothInchargeNameChange(boothInchargeName: value));
        },
        validator: (value) {
          if(value!.isEmpty){
            return AppLocalizations.of(context)!.empty;
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
