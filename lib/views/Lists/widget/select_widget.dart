import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

class SelectWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const SelectWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.fieldBackgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.blackColor,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,)),
            SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
