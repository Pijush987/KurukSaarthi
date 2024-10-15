import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(4),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder:(_,index){
          return notificationItem(context: context, time: '12:35 P.M.', message: 'Latest voter list update delayed by 1 hour', onTab: () {  });
        }, separatorBuilder: (_,index){
      return SizedBox(
        height: 15,
      );
    }, itemCount: 2);
  }
}

Widget notificationItem({required BuildContext context, required String time,required String message,required VoidCallback onTab}){
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.fieldBackgroundColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
          SvgImageWidget(svgPath: AssetsPath.crossIcon,color: null),
        ],
      ), SizedBox(height: 5),
      Text(message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.textFieldColor1,fontWeight: FontWeight.w600)),
    ],),
  );
}