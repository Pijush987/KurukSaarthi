import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/bloc/region_select_bloc/region_select_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

class RegionDropdownWidget extends StatelessWidget {
  const RegionDropdownWidget({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> dropdownItem = [
      AppLocalizations.of(context)!.bhandaraVidhanSabh,
      AppLocalizations.of(context)!.sakoliVidhanSabha,
      AppLocalizations.of(context)!.tumsarVidhanSabha
    ];



    return  BlocConsumer<RegionSelectBloc, RegionSelectState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return DropdownButtonFormField2<String>(
          onMenuStateChange: (v){
            context.read<RegionSelectBloc>().add(DropdownExpanded(isDropdownExpanded: v));
            if( state.isDropdownExpanded==true){
              context.read<RegionSelectBloc>().add(IconVisible(isIconVisible: true));
            }else{
              context.read<RegionSelectBloc>().add(IconVisible(isIconVisible: false));
            }
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
            AppLocalizations.of(context)!.chooseVidhanSabha,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.subTextColor,fontWeight: FontWeight.w600),
          ),
          items: dropdownItem.map((item) {
            final isSelected = state.selectedItemsList.contains(item);
            return DropdownMenuItem<String>(
              onTap: (){
                isSelected ? context.read<RegionSelectBloc>().add(RemoveItemEvent(item)):context.read<RegionSelectBloc>().add(AddItemEvent(item));
              },
              value: item,
              child: Row(
                children: [

                  if(state.selectedRegion == item && state.isIconVisible)
                    SvgImageWidget(svgPath: AssetsPath.arrowSelectDropdown,color: AppColors.primaryColor),
                  if(state.selectedRegion == item && state.isIconVisible)
                    SizedBox(width: 10),
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
              return AppLocalizations.of(context)!.pleaseSelectOneOption;
            }
            return null;
          },
          onChanged: (value) {
            print("ggggg");
            context.read<RegionSelectBloc>().add(RegionChange(selectedRegion: value.toString()));
            //Do something when selected item is changed.
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData:  IconStyleData(
            icon:state.isDropdownExpanded==true? SvgImageWidget(svgPath: AssetsPath.arrowUp,color: AppColors.primaryColor,):SvgImageWidget(svgPath: AssetsPath.arrowDown,color: AppColors.primaryColor),
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
          value: state.selectedItemsList.isEmpty ? null : state.selectedItemsList.last,
          selectedItemBuilder: (context) {
            return dropdownItem.map(
                  (item) {
                return Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600),
                );
              },
            ).toList();
          },
        );
      },
    );
  }
}


