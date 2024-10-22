import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/login_bloc/login_bloc.dart';
import 'package:kuruk_saarthi/bloc/region_select_bloc/region_select_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';



class ContinueButton extends StatelessWidget {
  final formKey;

  const ContinueButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionSelectBloc, RegionSelectState>(
      buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) async{
        if (state.postApiStatus == PostApiStatus.loading) {
          showCustomLoader(context,50);
        }
        if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: AppLocalizations.of(context)!.something_want_to_wrong_try_again);

        }

        if (state.postApiStatus == PostApiStatus.success) {

          Navigator.pop(context);
          Navigator.pushNamed(context, RoutesName.dashboard, arguments: (route) => false);
          context.flushBarSuccessMessage(message: state.message.toString());
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: AppLocalizations.of(context)!.continueBtn,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w500),
          borderRadios: 16,
          height: 44,
          width: 140,
          onPress: (){
            if(formKey.currentState.validate()){
              context.read<RegionSelectBloc>().add(RegionSelectApi());
            }
          },
        );
      },
    );
  }
}
