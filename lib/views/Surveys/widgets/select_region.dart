import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';

class SelectRegion extends StatelessWidget {
  const SelectRegion({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SurveysBloc, SurveysState>(
      builder: (context, state) {
        return DropdownButtonFormField2<String>(
          onMenuStateChange: (v){
            context.read<SurveysBloc>().add(RegionDropdownExpanded(isRegionDropdownExpanded: v));
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
          hint:Text(
            'Region',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.subTextColor,fontWeight: FontWeight.w600),
          ),
          items: state.allRegion.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
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
          onChanged: (value) async{
            context.read<SurveysBloc>().add(RegionChange(selectedRegion: value.toString()));
            await DatabaseHelper().getUniqueBoothNumbersByRegion(value.toString()).then((onValue){
              context.read<SurveysBloc>().add(BoothNumberListChange(allBoothNumberList: onValue));
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData:  IconStyleData(
            icon:state.isRegionDropdownExpanded==true? SvgImageWidget(svgPath: AssetsPath.arrowUp,color: AppColors.primaryColor,):SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
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
          value: state.selectedRegion.isEmpty ? null : state.selectedRegion,
        );
      },
    );
  }
}




class SelectArea extends StatelessWidget {
  const SelectArea({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SurveysBloc, SurveysState>(
      builder: (context, state) {
        return DropdownButtonFormField2<String>(
          onMenuStateChange: (v){
            context.read<SurveysBloc>().add(AreaDropdownExpanded(isAreaDropdownExpanded: v));
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
          hint:Text(
            'Area',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.subTextColor,fontWeight: FontWeight.w600),
          ),
          items: state.allArea.map((item) {
            // final isSelected = state.selectedRegionItemsList.contains(item);
            return DropdownMenuItem<String>(
              // onTap: (){
              //   isSelected ? context.read<SurveysBloc>().add(RemoveItemEvent(item)):context.read<SurveysBloc>().add(AddItemEvent(item));
              // },
              value: item,
              child: Row(
                children: [
                  // if(state.selectedRegion == item && state.isRegionIconVisible)
                  //   SvgImageWidget(svgPath: AssetsPath.arrowSelectDropdown,color: null),
                  // if(state.selectedRegion == item && state.isRegionIconVisible)
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
          onChanged: (value) async{
            context.read<SurveysBloc>().add(AreaChange(selectedArea: value.toString()));
            await DatabaseHelper().getAllRegions(value.toString()).then((onValue){
              context.read<SurveysBloc>().add(RegionListChange(allRegionList: onValue));
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData:  IconStyleData(
            icon:state.isAreaDropdownExpanded==true? SvgImageWidget(svgPath: AssetsPath.arrowUp,color: AppColors.primaryColor,):SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
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
          value: state.selectedArea.isEmpty ? null : state.selectedArea,
          // selectedItemBuilder: (context) {
          //   return regionList.map(
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