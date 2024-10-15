import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Alerts/widgets/notification_bar_widget.dart';
import 'package:kuruk_saarthi/views/Alerts/widgets/notification_list_widget.dart';
import 'package:kuruk_saarthi/views/Alerts/widgets/send_notification_widget.dart';

import '../../configs/color/color.dart';

class AlertsScreen extends StatefulWidget {
  final bool isBack;
  const AlertsScreen({super.key, required this.isBack});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> with TickerProviderStateMixin{
  final _notification = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController notificationController;



  @override
  void initState() {
    super.initState();
    notificationController = BottomSheet.createAnimationController(this);
    notificationController.duration = const Duration(milliseconds: 500);
    notificationController.reverseDuration = const Duration(milliseconds: 500);
    notificationController.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _notification.dispose();
    notificationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Constant.sideHorizontalPadding),
                child: Container(
                  color: Colors.transparent,
                  height: context.mediaQueryHeight,
                  child: Column(children: [
                    const SizedBox(height: 18),
                    NotificationBarWidget(isBack: widget.isBack,),
                    const SizedBox(height: 18),
                    const SizedBox(height: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child:const Column(children: [
                           NotificationListWidget(),
                           SizedBox(height: 150),
                        ],
                        ),
                      ),
                    ),
                  ],
                  ),
                ),
              ),
            ),
          floatingActionButton: FloatingActionButton.extended(
            focusColor: AppColors.transparent,
            hoverColor:AppColors.transparent,
            splashColor: AppColors.transparent,
            foregroundColor: AppColors.transparent,
            extendedPadding: EdgeInsets.zero,
            elevation: 0,
            onPressed: (){
              onSendNotification(_formKey);
            },
            label:Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add,color: AppColors.whiteColor),
                const SizedBox(width: 6),
                Text("Create alert",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          ),
        );
      },
    );
  }
  onSendNotification(GlobalKey<FormState> formKey){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        transitionAnimationController: notificationController,
        builder: (BuildContext context) {
          return SendNotificationWidget(formKey: formKey);
        }
    );
  }
}
