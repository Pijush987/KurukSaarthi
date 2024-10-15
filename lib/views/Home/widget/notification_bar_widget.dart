
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';

class NotificationBarWidget extends StatefulWidget {
  const NotificationBarWidget({super.key});

  @override
  State<NotificationBarWidget> createState() => _NotificationBarWidgetState();
}

class _NotificationBarWidgetState extends State<NotificationBarWidget> {

  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNotifications();
    notificationNotifier.addListener((){
      log("Notifier###########################666 ");
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
    return ValueListenableBuilder<String>(
      valueListenable: notificationNotifier,
      builder: (BuildContext context, String isValid, child) {
        log("isValid    $isValid");
        return   Row(
          children: [
            Expanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Notifications",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                SizedBox(width: 16),
                SvgImageWidget(svgPath: AssetsPath.notificationIcon,color: null)
              ],)),
            Expanded(child: InkWell(
              onTap: (){
                   Navigator.pushNamed(context, RoutesName.alert);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgImageWidget(svgPath: AssetsPath.plusCircleIcon,color: null),
                  SizedBox(width: 8),
                  Text("Show all (${notifications.length})",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),)
                ],),
            ))
          ],
        );
      },
    );
  }
}