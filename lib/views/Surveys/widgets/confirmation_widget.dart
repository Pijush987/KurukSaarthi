import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQueryWidth*0.4,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Row(
            children: [
              Text(AppLocalizations.of(context)!.totalMarked+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Text("15",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.positive+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Text("8",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.subTextColorGreen,fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.negative+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Text("5",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.subTextColorRed,fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.neutral+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Expanded(child: Text("3",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.subTextColorYellow,fontWeight: FontWeight.w500))),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.death+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Expanded(child: Text("2",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.subTextColorGray,fontWeight: FontWeight.w500))),
            ],
          ),

          SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                    height: 44,
                    title: AppLocalizations.of(context)!.submit,
                    borderRadios: 10,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.whiteColor,fontWeight: FontWeight.w600,),
                  onPress: (){
                      Navigator.pop(context);
                  },
                ),
              ),
            ],
          )

        ],),
    );
  }
}
