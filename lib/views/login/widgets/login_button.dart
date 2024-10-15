import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/login_bloc/login_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.loading) {
          debugPrint("step7");

          showCustomLoader(context,50);
        }
        if (state.postApiStatus == PostApiStatus.error) {
          debugPrint("step8");

          stopCustomLoader(context);
          context.flushBarErrorMessage(message: state.message.toString());
          context.read<LoginBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
        }

        if (state.postApiStatus == PostApiStatus.success) {
          debugPrint("step9");
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RoutesName.dashboard, (Route<dynamic> route) => false);

        }
      },
      builder: (context, state) {
        return CustomButton(
          title: AppLocalizations.of(context)!.login,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w500),
          borderRadios: 16,
          height: 44,
          width: 108,
          onPress: (){
            if(formKey.currentState.validate()){
              context.read<LoginBloc>().add(Login());
            }
          },
        );
      },
    );
  }
}
