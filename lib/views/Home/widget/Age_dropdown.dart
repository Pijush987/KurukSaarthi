import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/region_select/region_select_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgeDropdown extends StatefulWidget {
  final VoidCallback onTap;
  final RangeValues currentRangeValues ;

  const AgeDropdown({super.key, required this.onTap, required this.currentRangeValues});

  @override
  State<AgeDropdown> createState() => _AgeDropdownState();
}

class _AgeDropdownState extends State<AgeDropdown> {
  double _value = 30.0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: widget.onTap,
      child: Container(
        height: 130,
        width: context.mediaQueryWidth,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.fieldBackgroundColor,
        ),
        child:Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SfSlider(
                    min: 18.0,
                    max: 100.0,
                    value: _value,
                    stepSize: 1,
                    showTicks: true,
                    // thumbIcon: ,
                    showLabels: true,
                    enableTooltip: true,
                    shouldAlwaysShowTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value){
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("(${AppLocalizations.of(context)!.min})",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.blackColor,fontWeight: FontWeight.w400),),
                Text("(${AppLocalizations.of(context)!.max})",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.blackColor,fontWeight: FontWeight.w400),),

              ],),
            )
          ],
        ),
        // ),
      ),
    );
  }
}