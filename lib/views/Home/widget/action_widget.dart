
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Alerts/widgets/send_notification_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/attach_file_widget.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/new_surveys_aleart.dart';

import '../../../bloc/surveys_bloc/surveys_bloc.dart';

class ActionWidget extends StatelessWidget {
  final AnimationController notificationController;
  final AnimationController attachFilesController;
  final formKey;
  const ActionWidget({super.key, required this.notificationController, required this.attachFilesController, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(
            child:customAction(context:  context,text: "Change PIN",svgPath: AssetsPath.lockIcon,onTab: (){
              Navigator.pushNamed(context, RoutesName.chnagePin, arguments: (route) => false);
            })
        ),
        SizedBox(width: 14),
        Expanded(
            child:customAction(context:  context,text: "Notify users",svgPath: AssetsPath.notifyIcon,onTab: (){
              onSendNotification(context,formKey);
            })
        )
      ],),
      // SizedBox(height: 14),
      // customAction(context:  context,text: "Add a new Voters list",svgPath: AssetsPath.listIcon,onTab: (){
      //   onAttachFiles(context);
      // })
    ],);
  }

  customAction({required BuildContext context,required VoidCallback onTab, required String svgPath, required String text}){
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 55,
        width: context.mediaQueryWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:AppColors.fieldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.cardBorderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImageWidget(svgPath: svgPath,color: null),
            SizedBox(width: 12),
            Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),

          ],
        ),
      ),
    );
  }
  onSendNotification(BuildContext context, GlobalKey<FormState> key){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        transitionAnimationController: notificationController,
        builder: (BuildContext context) {
          return  SendNotificationWidget(formKey: key);
        }
    );
  }
  onAttachFiles(BuildContext context){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        transitionAnimationController: attachFilesController,
        builder: (BuildContext context) {
          return const AttachFileWidget();
        }
    );
  }
}