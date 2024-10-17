import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurveyTrackWidget extends StatelessWidget {
  const SurveyTrackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.cardBorderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            width: context.mediaQueryWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.electionSurvey+" - ${index+1}",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w500),),
                SizedBox(height: 12),
                Row(children: [
                  Expanded(child:Row(
                    children: [
                      Text(AppLocalizations.of(context)!.positive+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10),
                      Text("${345}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorGreen,fontWeight: FontWeight.w500),),
                    ],
                  ),),
                  Expanded(child:Row(
                    children: [
                      Text(AppLocalizations.of(context)!.negative+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10),
                      Text("${171}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorRed,fontWeight: FontWeight.w500),),
                    ],
                  ),),

                ],),
                SizedBox(height: 12),
                Row(children: [
                  Expanded(child:Row(
                    children: [
                      Text(AppLocalizations.of(context)!.neutral+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10),
                      Text("${100}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorYellow,fontWeight: FontWeight.w500),),
                    ],
                  ),),
                  Expanded(child:Row(
                    children: [
                      Text(AppLocalizations.of(context)!.death+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10),
                      Text("${101}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorGray,fontWeight: FontWeight.w500),),
                    ],
                  ),),

                ],),
                SizedBox(height: 12),

                Row(
                  children: [
                    Text(AppLocalizations.of(context)!.totalMarked+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                    SizedBox(width: 10),
                    Text("${101}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 12),
                Row(children: [
                  Expanded(
                    flex: 1,
                    child:Row(
                    children: [
                      Text(AppLocalizations.of(context)!.booth+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10),
                      Text("${166}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w500),),
                    ],
                  ),),
                  Expanded(
                    flex: 2,
                    child:Row(
                    children: [
                      Text(AppLocalizations.of(context)!.incharge+" : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10),
                      Flexible(child: Text("Akash Shendre frswws",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),)),
                    ],
                  ),),

                ],),
                SizedBox(height: 12),
                Row(children: [
                  Expanded(
                    child:Row(
                    children: [
                      SvgImageWidget(svgPath: AssetsPath.calender,color: null),
                      SizedBox(width: 10),
                      Text("26 Sept, 2024",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorGray,fontWeight: FontWeight.w500),),
                    ],
                  ),),
                  Expanded(
                    child:Row(
                    children: [
                      SvgImageWidget(svgPath: AssetsPath.clock,color: null),
                      SizedBox(width: 10),
                      Text("12 : 45 P.M. ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorGray,fontWeight: FontWeight.w500),),
                    ],
                  ),),

                ],),

              ],
            ),
          );
        },
        separatorBuilder:  (context,index){
          return SizedBox(
            height: 20,
          );
        },
        itemCount: 50
    );
  }
}
