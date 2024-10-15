import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/notification_bloc/notification_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/utils/extension/validations_exception.dart';

class NotificationTextfieldWidget extends StatelessWidget {
  const NotificationTextfieldWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        cursorColor: AppColors.secondaryTextColor,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 15,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 6),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 50,
              maxWidth: 50,
              minHeight: 18,
              minWidth: 18
          ),
          hintText:'e.g. The voters list has been updated',
          hintStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 15,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.fieldBackgroundColor,width: 1.5)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.fieldBackgroundColor,width: 1.5)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.primaryColor,width: 1.5)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: AppColors.primaryColor,width: 1.5)
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          context.read<NotificationBloc>().add(SaveNotificationData(notificationData: value));
        },
        validator: (value) {
          if(value!.isEmpty){
            return "Please enter your message.";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
