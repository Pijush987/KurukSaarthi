import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AttachFileWidget extends StatelessWidget {
  const AttachFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.transparent,
      hoverColor:AppColors.transparent,
      splashColor: AppColors.transparent,
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        height: context.mediaQueryHeight,
        width: context.mediaQueryWidth,
        child: Center(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppLocalizations.of(context)!.attachFile,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.w500)),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.cardBorderColor)
                  ),
                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(AppLocalizations.of(context)!.noFileChosen,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400)),
                        ),),
                        CustomButton(
                          height: 44,
                          width: 100,
                          backgroundColor: AppColors.fieldBackgroundColor,
                          padding: EdgeInsets.all(10),
                          widget: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            SvgImageWidget(svgPath: AssetsPath.attach_file,color: null),
                            SizedBox(width: 10),
                            Text(AppLocalizations.of(context)!.attach,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),

                          ],),
                          borderRadios: 10,

                        )],
                    ),
                ),
                  SizedBox(height: 30),
                  CustomButton(
                    height: 44,
                      width: 110,
                      title:AppLocalizations.of(context)!.upload,
                      borderRadios: 10,
                      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.whiteColor,fontWeight: FontWeight.w600)
                  )

                ],),
            ),
          ),
        ),
      ),
    );
  }
}
