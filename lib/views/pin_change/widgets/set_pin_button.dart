import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetPinButton extends StatelessWidget {
  final formKey;

  const SetPinButton({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinChangeBloc, PinChangeState>(
      // buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
          if (state.postApiStatus == PostApiStatus.loading) {
            debugPrint("step7");
            showCustomLoader(context,50);
          }

          if (state.postApiStatus == PostApiStatus.error) {
            debugPrint("step8");
            stopCustomLoader(context);
            context.flushBarErrorMessage(message: state.message.toString());
            context.read<PinChangeBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
          }

          if (state.postApiStatus == PostApiStatus.success) {
            stopCustomLoader(context);
            context.flushBarSuccessMessage(message:AppLocalizations.of(context)!.pinChangeSuccessful);
            context.read<PinChangeBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
          }
        },
      builder: (context, state) {
        return CustomButton(
          title: AppLocalizations.of(context)!.setPIN,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w700),
          borderRadios: 14,
          height: 50,
          width: 100,
          onPress: (){
            if(formKey.currentState.validate()){
              context.read<PinChangeBloc>().add(PinChangeApi());
            }
          },
        );
      },
    );
  }
}
