import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/custom_button.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Home/widget/booth_inChrageName.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/booth_number_aleart.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/confirmation_widget.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/select_region.dart';

class NewSurveysAleart extends StatelessWidget {
  const NewSurveysAleart({super.key});

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
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Text(AppLocalizations.of(context)!.area,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500)),

                    SizedBox(height: 10),

                    SelectArea(),

                    SizedBox(height: 15),

                    Text(AppLocalizations.of(context)!.region,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500)),

                    SizedBox(height: 10),

                    SelectRegion(),

                    SizedBox(height: 15),

                    Text(AppLocalizations.of(context)!.boothNumber,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500)),

                    SizedBox(height: 10),
                    BoothNumberAleart(),
                    SizedBox(height: 15),
                    Text(AppLocalizations.of(context)!.boothInchargeName,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    BoothInchragename(),
                    SizedBox(height: 30),
                    BlocConsumer<SurveysBloc, SurveysState>(
                      listener: (context, state) {
                        if (state.postApiStatus == PostApiStatus.loading) {
                          showCustomLoader(context,50);
                        }
                        if (state.postApiStatus == PostApiStatus.error) {
                          stopCustomLoader(context);
                          context.flushBarErrorMessage(message: state.message.toString());
                          context.read<SurveysBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
                        }

                        if (state.postApiStatus == PostApiStatus.success) {
                          context.read<SurveysBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
                          stopCustomLoader(context);
                          if(state.message.isNotEmpty){
                            context.flushBarErrorMessage(message: state.message.toString());
                          }
                          context.flushBarSuccessMessage(message: AppLocalizations.of(context)!.inchargeCreateSuccessful);
                          // Navigator.pop(context);
                          // context.read<DashboardBloc>().add(CurrentIndexChange(currentIndex: 1));
                          // showDialog(
                          //   context: context,
                          //   barrierDismissible: false,
                          //   builder: (BuildContext context) {
                          //     return alert;
                          //   },
                          // );
                          // AlertDialog alert = AlertDialog(
                          //     iconPadding:EdgeInsets.zero,
                          //     backgroundColor: AppColors.whiteColor,
                          //     titlePadding: EdgeInsets.zero,
                          //     contentPadding: EdgeInsets.zero,
                          //     insetPadding: EdgeInsets.zero,
                          //     actionsPadding: EdgeInsets.zero,
                          //     content: ConfirmationWidget()
                          // );
                        }
                      },
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              height: 44,
                              width: 110,
                              title: AppLocalizations.of(context)!.proceed,
                              borderRadios: 10,
                              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.whiteColor,fontWeight: FontWeight.w600),
                              onPress:state.boothInchargeName.isEmpty?null: ()async{
                                FocusScope.of(context).requestFocus(FocusNode());
                                log("name ${state.boothInchargeName}");
                                  context.read<SurveysBloc>().add(CreateBoothIncharge());
                                }
                            ),
                            CustomButton(
                                height: 44,
                                width: 110,
                                title: AppLocalizations.of(context)!.close,
                                backgroundColor: Colors.white,
                                borderColor: AppColors.primaryColor,
                                borderRadios: 10,
                                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,color: AppColors.primaryColor,fontWeight: FontWeight.w600),
                                onPress:()async{
                                  Navigator.pop(context);
                                }
                            ),
                          ],
                        );
                      },
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
// set up the AlertDialog
