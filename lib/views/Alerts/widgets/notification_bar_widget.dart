
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';

import '../../../services/database/database_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationBarWidget extends StatefulWidget {
  final bool isBack;
  const NotificationBarWidget({super.key, required this.isBack});

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
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              if(widget.isBack){
                Navigator.pop(context);
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(widget.isBack)
                  SvgImageWidget(svgPath: AssetsPath.backArrow,color: null),
                if(widget.isBack)
                  SizedBox(width: 16),
                Text(AppLocalizations.of(context)!.notifications+" (${notifications.length})",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),


              ],),
          ),
          InkWell(
            onTap: () async{
              final dbHelper = DatabaseHelper();
                await dbHelper.deleteAllNotifications();
                print("All notifications deleted.");
              _loadNotifications();
              setState(() {});
              notificationNotifier.value = "notify";
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgImageWidget(svgPath: AssetsPath.deleteIcon,color: null),
                SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.deleteAll,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),)
              ],),
          )
        ],
      );
        });
  }
}
