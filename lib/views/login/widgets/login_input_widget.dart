import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/login_bloc/login_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/utils/extension/validations_exception.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginInputWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
   LoginInputWidget({super.key, required this.focusNode, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state.postApiStatus == PostApiStatus.success && state.postApiStatus == PostApiStatus.error){
          textEditingController.clear();
        }
      },
      builder: (context, state) {
        return Pinput(
          autofocus: false,
          autofillHints: [AutofillHints.username],
          length: 5,
          focusNode: focusNode,
          controller: textEditingController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ], //
          defaultPinTheme: PinTheme(
            width: context.mediaQueryWidth/5*0.7,
            height: 55,
            textStyle: const TextStyle(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.pinBorderColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: context.mediaQueryWidth/5*0.7,
            height: 55,
            textStyle: const TextStyle(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: context.mediaQueryWidth/5*0.7,
            height: 55,
            textStyle: const TextStyle(fontSize: 20, color: AppColors.blackColor, fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.pinBorderColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: (value) {
            if(value!.isEmpty){
              return AppLocalizations.of(context)!.enterYourPin;
            }
            if(value.length != 5){
              return AppLocalizations.of(context)!.pinCodeShouldBe5digit;
            }
            if(value.pinValidator()){
              return AppLocalizations.of(context)!.pinIsNotCorrect;
            }
            return null;
          },
          pinputAutovalidateMode:PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) {
            context.read<LoginBloc>().add(PinChange(loginPin: pin));
          },
        );
      },
    );
  }
}
