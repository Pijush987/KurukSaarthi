import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';

class SetPinButton extends StatelessWidget {
  final formKey;

  const SetPinButton({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinChangeBloc, PinChangeState>(
      // buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {

      },
      builder: (context, state) {
        return CustomButton(
          title: 'Set PIN',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w700),
          borderRadios: 14,
          height: 50,
          width: 100,
          onPress: (){
            if(formKey.currentState.validate()){

            }
          },
        );
      },
    );
  }
}
