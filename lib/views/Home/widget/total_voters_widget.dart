
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TotalVotersWidget extends StatefulWidget {
  const TotalVotersWidget({super.key});

  @override
  State<TotalVotersWidget> createState() => _TotalVotersWidgetState();
}

class _TotalVotersWidgetState extends State<TotalVotersWidget> {
  late String total = '';
  late String lastDate = '';
  final dbHelper = DatabaseHelper();


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
    total = await SessionController().sharedPreferenceClass.readValue('totalVoters')??'';
    final data = await dbHelper.getTotalCount();
    total = data.toString();
    if( data == 0||  data<int.parse(total)){
    isDataSync.value = true;
    }
    else{
      isDataSync.value = false;
    }

    DateTime date = DateTime.now();
    var now = Jiffy.parse(date.toString()).format(pattern: 'MMMM do yyyy');
    lastDate = now;
    if (mounted) {
      setState(() {});
      notificationNotifier.value = "reset";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.cardBorderColor)
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.totalVoters,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text("$total",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28,color: AppColors.primaryColor,fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          Text("${AppLocalizations.of(context)!.asOf} ${lastDate}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),

        ],
      ),
    );
  }
}
