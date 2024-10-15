import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

class SearchTextFromFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  const SearchTextFromFieldWidget({super.key, required this.focusNode,required this.onChange,required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 60,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: AppColors.secondaryTextColor,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 6),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
            minHeight: 18,
            minWidth: 18
          ),
          suffixIcon: SvgImageWidget(svgPath: AssetsPath.searchIcon,color: null),
          hintText: AppLocalizations.of(context)!.searchByNameOrVoterId,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.blackColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: AppColors.transparent)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: AppColors.transparent)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: AppColors.transparent)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: AppColors.transparent)
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter email';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }
}