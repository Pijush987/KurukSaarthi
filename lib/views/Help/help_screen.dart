import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Constant.sideHorizontalPadding),
            child: Container(
              color: Colors.transparent,
              height: context.mediaQueryHeight,
              child: Column(children: [
                const SizedBox(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgImageWidget(svgPath: AssetsPath.backArrow,color: null),
                    SizedBox(width: 16),
                    Text("Help centre",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                    SizedBox(height: 50),
                   ],),
                Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.cardBorderColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgImageWidget(svgPath: AssetsPath.call,color: null),
                            SizedBox(width: 10),
                            Text("Contact number",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
                          ],
                        ), SizedBox(height: 10),
                        Text("727-XXX-XX89",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20,color: AppColors.textFieldColor1,fontWeight: FontWeight.w600)),
                      ],)

                ),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.cardBorderColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgImageWidget(svgPath: AssetsPath.email,color: null),
                            SizedBox(width: 10),
                            Text("E-mail address",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
                          ],
                        ), SizedBox(height: 10),
                        Text("support@kuruksaarthi.in",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20,color: AppColors.textFieldColor1,fontWeight: FontWeight.w600)),
                      ],),

                )

              ],),
            ),
          ),
        )
    );
  }
}