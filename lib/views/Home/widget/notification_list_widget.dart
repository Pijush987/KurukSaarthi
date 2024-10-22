import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';

class NotificationListWidget extends StatefulWidget {
  const NotificationListWidget({super.key});

  @override
  State<NotificationListWidget> createState() => _NotificationListWidgetState();
}

class _NotificationListWidgetState extends State<NotificationListWidget> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNotifications();
    notificationNotifier.addListener((){
      _loadNotifications();
    });
  }

  void _loadNotifications() async {
    final data = await dbHelper.getNotifications();
    notifications = data;
    if (mounted) {
      setState(() {});
      notificationNotifier.value = "reset";
    }
  }

  @override
  Widget build(BuildContext context) {
    return notifications.isEmpty?SizedBox():
    ValueListenableBuilder<String>(
      valueListenable: notificationNotifier,
      builder: (BuildContext context, String isValid, child) {
        return  ListView.separated(
            padding: EdgeInsets.all(4),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(_,index){
              return notificationItem(context: context, time: notifications[index]['date']??'', message:notifications[index]['message']??'', onTab: () {  });
            }, separatorBuilder: (_,index){
          return SizedBox(
            height: 15,
          );
        }, itemCount: 1);
      },
    );
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
            // SvgImageWidget(svgPath: AssetsPath.crossIcon,color: null),
          ],
        ), SizedBox(height: 5),
        Text(message,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.textFieldColor1,fontWeight: FontWeight.w600)),
      ],),
  );
}