import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoothDropdownWidget extends StatelessWidget {
  final VoidCallback onTap;
  const BoothDropdownWidget({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      '166, Mission Ground',
      '170, High School',
      '171, Main office',
      '172, Mission Ground',
      '173, High School',
      '174, Main office'
    ];
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: onTap,
      child: Container(
        height: 280,
        width: context.mediaQueryWidth,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.fieldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppLocalizations.of(context)!.selectBoothNumbere,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w700),),
            ),
            ListView.separated(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_,index){
              return Row(
                children: [
                  Icon(index == 3?Icons.circle_rounded:Icons.circle_outlined,color: AppColors.primaryColor,size: 16,),
                  SizedBox(width: 14),
                  Text(items[index],style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600),),
                ],
              );
            }, separatorBuilder: (_,index){
              return SizedBox(height: 10);
            }, itemCount: items.length)
          ],
        ),
        // ),
      ),
    );
  }
}