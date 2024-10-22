import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';

import '../../../bloc/surveys_bloc/surveys_bloc.dart';
import '../../../configs/components/svg_image_widget.dart';
import '../../../utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoseVoterWidget extends StatelessWidget {
  final String selectedSurvey;
  final String voterIDNumber;
  final int index;
  const ChoseVoterWidget({super.key, required this.selectedSurvey, required this.index, required this.voterIDNumber});

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItem = [
      'PARTY+',
      'PARTY-',
      'NEUTRAL',
      'DEAD',
    ];
    log("Success   ### ${selectedSurvey}");
    log("Success   ### ${index}");

    return DropdownButtonFormField2<String>(
      onMenuStateChange: (v){
        // context.read<SurveysBloc>().add(VoterDropdownExpanded(index: index));
        // if( state.isVoterDropdownExpanded[index] == ){
        //   context.read<SurveysBloc>().add(VoterIconVisible(isVoterIconVisible: true));
        // }else{
        //   context.read<SurveysBloc>().add(VoterIconVisible(isVoterIconVisible: false));
        // }
      },
      barrierColor:AppColors.transparent,
      isExpanded: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10,bottom: 10),
        focusColor: AppColors.transparent,
        hoverColor:AppColors.transparent,
        fillColor: AppColors.transparent,
        border: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColors.cardBorderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:const BorderSide(color: AppColors.cardBorderColor),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColors.cardBorderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        // Add more decoration..
      ),
      hint:Text(
          AppLocalizations.of(context)!.markVoterComponent,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600),
      ),
      items: dropdownItem.map((item) {
        // final isSelected = state.selectedVoterItemsList.contains(item);
        return DropdownMenuItem<String>(
          // onTap: (){
          //   isSelected ? context.read<SurveysBloc>().add(VoterRemoveItemEvent(item)):context.read<SurveysBloc>().add(VoterAddItemEvent(item));
          // },
          value: item,
          child: Row(
            children: [
              // if(state.selectedVoter == item && state.isVoterIconVisible)
              //   SvgImageWidget(svgPath: AssetsPath.arrowSelectDropdown,color: null),
              // if(state.selectedVoter == item && state.isVoterIconVisible)
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
        print("ggggg  $selectedSurvey");
        context.read<SurveysBloc>().add(VoterChange(voterIDNumber, voterNumberChange: value.toString(),index: index,isUpdate: selectedSurvey.isNotEmpty));
        //Do something when selected item is changed.
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData:  IconStyleData(
        icon:SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        elevation: 0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.dropdownBorderColor),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),),
      ),
      menuItemStyleData:   MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      value: selectedSurvey.isEmpty || selectedSurvey == "null"? null : selectedSurvey,
      // selectedItemBuilder: (context) {
      //   return dropdownItem.map(
      //         (item) {
      //       return Text(
      //         item,
      //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600),
      //       );
      //     },
      //   ).toList();
      // },
    );
  }
}
