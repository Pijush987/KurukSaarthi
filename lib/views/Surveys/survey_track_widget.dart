import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';

class SurveyTrackWidget extends StatelessWidget {
  final String positive;
  final String negitive;
  final String dead;
  final String neutral;
  final String total;
  final String booth;
  final String inchargeName;
 final String index;
  final String time;
  const SurveyTrackWidget({super.key, required this.positive, required this.negitive, required this.dead, required this.neutral, required this.total, required this.booth, required this.inchargeName, required this.time, required this.index});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      width: context.mediaQueryWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Election Survey - ${index}",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w500),),
          SizedBox(height: 12),
          Row(children: [
            Expanded(child:Row(
              children: [
                Text("Positive : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                SizedBox(width: 10),
                Text("${positive}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorGreen,fontWeight: FontWeight.w500),),
              ],
            ),),
            Expanded(child:Row(
              children: [
                Text("Negative : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                SizedBox(width: 10),
                Text("${negitive}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorRed,fontWeight: FontWeight.w500),),
              ],
            ),),

          ],),
          SizedBox(height: 12),
          Row(children: [
            Expanded(child:Row(
              children: [
                Text("Neutral : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                SizedBox(width: 10),
                Text("${neutral}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorYellow,fontWeight: FontWeight.w500),),
              ],
            ),),
            Expanded(child:Row(
              children: [
                Text("Death : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
                SizedBox(width: 10),
                Text("${dead}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.subTextColorGray,fontWeight: FontWeight.w500),),
              ],
            ),),

          ],),
          SizedBox(height: 12),

          Row(
            children: [
              Text("Total marked : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
              SizedBox(width: 10),
              Text("${total}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 12),
          Divider(),
          SizedBox(height: 12),
          Row(
            children: [
              Text("Booth : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
              SizedBox(width: 10),
              Text("${booth}",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text("Incharge : ",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),),
              SizedBox(width: 10),
              Flexible(child: Text(inchargeName,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis),)),
            ],
          ),
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
  }
}