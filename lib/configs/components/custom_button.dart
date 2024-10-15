import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final IconData? icon;
  final VoidCallback? onPress;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? borderRadios;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  final AlignmentGeometry? alignment;
  final Widget? widget;


  const CustomButton({
    super.key,
      this.height,
      this.width,
      this.title,
      this.icon,
      this.onPress,
      this.borderColor,
      this.backgroundColor,
      this.iconColor,
      this.textStyle,
      this.borderRadios,
      this.boxShadow,
      this.padding,
      this.margin,
      this.alignment,
      this.widget
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: onPress,
      child: Container(
        margin: margin?? EdgeInsets.zero,
        padding: padding??EdgeInsets.zero,
        height: height?? context.mediaQueryHeight * 0.065,
        width: width?? context.mediaQueryWidth * 0.5,
        alignment: alignment?? Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor??AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadios??10),
          border: Border.all(color: borderColor??AppColors.transparent),
          boxShadow: boxShadow,
        ),
        child: widget??Text(title??'Button',style: textStyle?? Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18,color: AppColors.whiteColor,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
