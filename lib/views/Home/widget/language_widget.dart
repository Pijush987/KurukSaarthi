import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/utils/const.dart';


class LanguageWidget extends StatelessWidget {
  final VoidCallback onTap;
  const LanguageWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: onTap,
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.cardBackgroundColor,
            border: Border.all(color: AppColors.cardBorderColor)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<String>(
                valueListenable: selectLanguage,
                builder: (BuildContext context, String selectLanguage, child) {
                  return Text(selectLanguage,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600),);
                }),
            SizedBox(width: 10),
            SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}

