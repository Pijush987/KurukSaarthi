import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/surveys_bloc/surveys_bloc.dart';
import '../../../configs/color/color.dart';
import '../../../configs/components/svg_image_widget.dart';


class BoothNumberAleart extends StatelessWidget {
  const BoothNumberAleart({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SurveysBloc, SurveysState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<String> boothList = [];
        boothList.addAll(state.boothNumberItemsList);
        return DropdownButtonFormField2<String>(
          onMenuStateChange: (v){
            context.read<SurveysBloc>().add(BoothDropdownExpanded(isBoothDropdownExpanded: v));
            // if( state.isBoothNumberDropdownExpanded==true){
            //   context.read<SurveysBloc>().add(BoothIconVisible(isBoothIconVisible: true));
            // }else{
            //   context.read<SurveysBloc>().add(BoothIconVisible(isBoothIconVisible: false));
            // }
          },
          barrierColor:AppColors.transparent,
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            focusColor: AppColors.transparent,
            hoverColor:AppColors.transparent,
            fillColor: AppColors.transparent,
            border: OutlineInputBorder(
              borderSide:const BorderSide(color: AppColors.dropdownBorderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:const BorderSide(color: AppColors.dropdownBorderColor),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:const BorderSide(color: AppColors.dropdownBorderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            // Add more decoration..
          ),
          hint:Text(AppLocalizations.of(context)!.booth,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.subTextColor,fontWeight: FontWeight.w600),
          ),
          items: boothList.map((item) {
            // final isSelected = state.selectedBoothNumberItemsList.contains(item);
            return DropdownMenuItem<String>(
              // onTap: (){
              //   isSelected ? context.read<SurveysBloc>().add(BoothRemoveItemEvent(item)):context.read<SurveysBloc>().add(BoothAddItemEvent(item));
              // },

              value: item,
              child: Row(
                children: [
                  // if(state.selectedBoothNumber == item && state.isBoothNumberIconVisible)
                  //   SvgImageWidget(svgPath: AssetsPath.arrowSelectDropdown,color: null),
                  // if(state.selectedBoothNumber == item && state.isBoothNumberIconVisible)
                  //   SizedBox(width: 10),
                  Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          } )
              .toList(),
          validator: (value) {
            if (value == null) {
              return "efgefwefwe";
            }
            return null;
          },
          onChanged: (value) {
            context.read<SurveysBloc>().add(BoothNumberChange(boothNumberChange: value.toString()));
            //Do something when selected item is changed.
          },
          buttonStyleData: const ButtonStyleData(

            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData:  IconStyleData(
            icon:state.isBoothNumberDropdownExpanded==true? SvgImageWidget(svgPath: AssetsPath.arrowUp,color: AppColors.primaryColor,):SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: context.mediaQueryWidth*0.8,
            elevation: 0,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.dropdownBorderColor),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),),
          ),
          menuItemStyleData:   MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          value: state.selectedBoothNumber.isEmpty ? null : state.selectedBoothNumber,
          // selectedItemBuilder: (context) {
          //   return boothList.map(
          //         (item) {
          //       return Text(
          //         item,
          //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600),
          //       );
          //     },
          //   ).toList();
          // },
        );
      },
    );
  }
}
