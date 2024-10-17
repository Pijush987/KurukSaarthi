import 'dart:io' show Platform;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';

Future showCustomLoader(BuildContext context,double? size){
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Center(
          child: SizedBox(
              width: size??50,
              height: size??50,
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator(
                color: AppColors.primaryColor,
              ) :   SpinKitFadingCircle(
                size: 50,
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index.isEven ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.7),
                    ),
                  );
                },
              )
          ),
        )
      );
    },
  );
}

Future showSyncAlertDialog(BuildContext context,double? size){
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(AppLocalizations.of(context)!.waitUntilSyncNotComplete +  "\n"+AppLocalizations.of(context)!.thisWillTake7to10MinuteAndUserNeedToGoodInternetConnection,textAlign: TextAlign.center, style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),),
          backgroundColor: Colors.white,
          content: SizedBox(
              width: size??50,
              height: size??50,
              child:   SpinKitPouringHourGlassRefined(
                size: 50,
                color:AppColors.subTextColorGreen ,
              )
          )
      );
    },
  );
}

Future stopCustomLoader(BuildContext context) async{
  Navigator.of(context).pop();
}

// class LoadingWidget extends StatelessWidget {
//   final double size;
//   const LoadingWidget({super.key, this.size = 50.0});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: size,
//         height: size,
//         child: Platform.isIOS
//             ? const CupertinoActivityIndicator(
//              color: AppColors.primaryColor,
//         ) :   SpinKitFadingCircle(
//           size: 50,
//           itemBuilder: (BuildContext context, int index) {
//             return DecoratedBox(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: index.isEven ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.7),
//               ),
//             );
//           },
//         )
//       ),
//     );
//   }
// }