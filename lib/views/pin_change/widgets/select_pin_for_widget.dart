import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';

class SelectPinForWidget extends StatelessWidget {

  const SelectPinForWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinChangeBloc, PinChangeState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: customAction(context: context,onTab: (){
              context.read<PinChangeBloc>().add(PinChangeFor(pinChangeFor: 'Karyakarta'));
            },text:"Karyakarta" ,isSelectItem: state.pinChangeFor == "Karyakarta")),
            SizedBox(width: 12),
            Expanded(child: customAction(context: context,onTab: (){
              context.read<PinChangeBloc>().add(PinChangeFor(pinChangeFor: 'Booth Incharge'));
            },text:"Booth Incharge" ,isSelectItem: state.pinChangeFor == "Booth Incharge"))
          ],
        );
      },
    );
  }
  customAction({required BuildContext context,required VoidCallback onTab, required String text,required bool isSelectItem}){
    return InkWell(
      focusColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: onTab,
      child: Container(
        height: 55,
        width: context.mediaQueryWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // color:AppColors.fieldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.cardBorderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color:isSelectItem? AppColors.primaryColor:AppColors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.primaryColor)
                ),
                child:isSelectItem? SvgImageWidget(svgPath: AssetsPath.selectIcon,color: null):SizedBox(),
            ),
            SizedBox(width: 12),
            Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),

          ],
        ),
      ),
    );
  }

}
