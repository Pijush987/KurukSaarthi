import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../configs/color/color.dart';
import '../../../configs/components/custom_button.dart';

class SubmitWidget extends StatelessWidget {
  const SubmitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mediaQueryWidth*0.5,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.areYouSureYouWantToConfirm,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
          SizedBox(height: 30),

          Row(
            children: [
              Text(AppLocalizations.of(context)!.region+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.region,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.boothNumber+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Text("123",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.boothInchargeName+" : ",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),
              SizedBox(width: 8),
              Expanded(child: Text("Surash roy rana",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500))),
            ],
          ),

          SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 44,
                  width: 110,
                  title: AppLocalizations.of(context)!.cancel,
                  borderRadios: 10,
                  backgroundColor:AppColors.whiteColor,
                  borderColor:AppColors.primaryColor,
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.w600,),
                  onPress: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  height: 44,
                  width: 110,
                  title: AppLocalizations.of(context)!.confirm,
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
