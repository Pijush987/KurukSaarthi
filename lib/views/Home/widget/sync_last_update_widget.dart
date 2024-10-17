import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/const.dart';

class SyncLastUpdateWidget extends StatefulWidget {
  const SyncLastUpdateWidget({super.key});

  @override
  State<SyncLastUpdateWidget> createState() => _SyncLastUpdateWidgetState();
}

class _SyncLastUpdateWidgetState extends State<SyncLastUpdateWidget> {

  late String lastSync = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetails();
    notificationNotifier.addListener((){
      _getDetails();
    });
  }

  void _getDetails() async {
    var ls = await SessionController().sharedPreferenceClass.readValue('lastSync');
    print("ls  $ls");
    if(ls == null){
      lastSync = "Not synced";
    }else{
      lastSync = ls;
    }
    if (mounted) {
      setState(() {});
      notificationNotifier.value = "reset";
    }
  }





  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.fieldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.lastSynced,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text("$lastSync",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
