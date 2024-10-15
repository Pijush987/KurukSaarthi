import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/notification_bloc/notification_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Alerts/widgets/notification_textfield_widget.dart';

class SendNotificationWidget extends StatelessWidget {
  final formKey;
  const SendNotificationWidget({super.key, required this.formKey});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      focusColor: AppColors.transparent,
      hoverColor:AppColors.transparent,
      splashColor: AppColors.transparent,
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        height: context.mediaQueryHeight,
        width: context.mediaQueryWidth,
        child: Center(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text("Notification title",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.w500)),
                  SizedBox(height: 30),
                  NotificationTextfieldWidget(),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: BlocConsumer<NotificationBloc, NotificationState>(
                          buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
                          listener: (context, state) {
                            if (state.postApiStatus == PostApiStatus.loading) {
                              showCustomLoader(context,50);
                            }
                            if (state.postApiStatus == PostApiStatus.error) {
                              stopCustomLoader(context);
                              context.flushBarErrorMessage(message: state.message.toString());
                              context.read<NotificationBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
                            }
                            if (state.postApiStatus == PostApiStatus.success) {
                              stopCustomLoader(context);
                              Navigator.pop(context);
                              context.read<NotificationBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                                onPress: (){
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  if(formKey.currentState!.validate()){
                                    context.read<NotificationBloc>().add(NotificationsApi());
                                  }
                                },
                                title: "Send notification",
                                borderRadios: 10,
                                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.whiteColor,fontWeight: FontWeight.w600)
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                            onPress: (){
                              Navigator.pop(context);
                            },
                            title: "Cancel",
                            borderRadios: 10,
                            backgroundColor: AppColors.whiteColor,
                            borderColor: AppColors.primaryColor,
                            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.primaryColor,fontWeight: FontWeight.w600)
                        ),
                      )
                    ],
                  )
                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
