import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';


class LanguageSelectionWidget extends StatelessWidget {
  final VoidCallback onTap;
  const LanguageSelectionWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'मराठी',
      'English'
    ];
    return InkWell(
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      focusColor: AppColors.transparent,
      onTap: onTap,
      child: Container(
        height: 150,
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
              child: Text("Select Region",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w700),),
            ),
            ListView.separated(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_,index){
                  return Row(
                    children: [
                      Icon(index == 1?Icons.circle_rounded:Icons.circle_outlined,color: AppColors.primaryColor,size: 16,),
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

