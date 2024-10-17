import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/utils/extension/validations_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewPinFormField extends StatelessWidget {
  final FocusNode focusNode;
  const NewPinFormField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinChangeBloc, PinChangeState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              // color: AppColors.textFieldColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              focusNode: focusNode,
              cursorColor: AppColors.secondaryTextColor,
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
              ],
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 15,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(left: 6),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: 50,
                    maxWidth: 50,
                    minHeight: 18,
                    minWidth: 18
                ),
                suffixIcon: InkWell(
                  onTap: (){
                    context.read<PinChangeBloc>().add(ChangeNewPinVisible(newPinVisible: !state.isNewPinVisible));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgImageWidget(svgPath: AssetsPath.showPassword,color: null),
                  ),
                ),
                hintText:AppLocalizations.of(context)!.enterNewPIN,
                hintStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 15,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w400,decoration: TextDecoration.none,  decorationThickness: 0,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.fieldBackgroundColor,width: 1.5)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.fieldBackgroundColor,width: 1.5)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.primaryColor,width: 1.5)
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.primaryColor,width: 1.5)
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                context.read<PinChangeBloc>().add(ChangeNewPin(newPin: value));
              },
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
              obscureText: state.isNewPinVisible,
              textInputAction: TextInputAction.next,
            ),
          );
        });
  }
}
