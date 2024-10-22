import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/pin_change_bloc/pin_change_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/pin_change/widgets/confirm_pin_form_fields.dart';
import 'package:kuruk_saarthi/views/pin_change/widgets/new_pin_form_field.dart';
import 'package:kuruk_saarthi/views/pin_change/widgets/select_pin_for_widget.dart';
import 'package:kuruk_saarthi/views/pin_change/widgets/set_pin_button.dart';

import '../../bloc/home_bloc/home_bloc.dart';

class PinChange extends StatefulWidget {
  const PinChange({super.key});

  @override
  State<PinChange> createState() => _PinChangeState();
}

class _PinChangeState extends State<PinChange> {
    final _newPin = FocusNode();
    final _confirmPin = FocusNode();
    final _formKey = GlobalKey<FormState>();



    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      _newPin.dispose();
      _confirmPin.dispose();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Constant.sideHorizontalPadding),
              child: Container(
                color: Colors.transparent,
                height: context.mediaQueryHeight,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                              child: SvgImageWidget(svgPath: AssetsPath.backArrow,color: null)),
                          SizedBox(width: 16),
                          Text("Change PIN",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                        ],),
                      SizedBox(height: 24),
                      Expanded(child:SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Set PIN for",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                            SizedBox(height: 16),
                            SelectPinForWidget(),
                            SizedBox(height: 30),
                            Text("New PIN",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 15,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                            SizedBox(height: 20),
                            NewPinFormField(focusNode: _newPin,),
                            SizedBox(height: 16),
                            ConfirmPinFormFields(focusNode: _confirmPin),
                            SizedBox(height: 40),
                            SetPinButton(formKey: _formKey)
                          ],
                        ),

                      ))
                    ],),
                ),
              ),
            ),
          )
      );
    }
  }

