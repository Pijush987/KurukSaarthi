
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/new_surveys_aleart.dart';

import '../../../bloc/surveys_bloc/surveys_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActionWidget extends StatelessWidget {
  final AnimationController newSurveysAlertController;
  const ActionWidget({super.key, required this.newSurveysAlertController});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      customAction(context:  context,text: AppLocalizations.of(context)!.create_a_new_survey_for_voters_list,svgPath: AssetsPath.addCircle,onTab: ()async{
        showCustomLoader(context, 55);
        await DatabaseHelper().getAllArea().then((onValue)async{
          context.read<SurveysBloc>().add(AreaListChange(allAreaList: onValue));
          stopCustomLoader(context);
            onNewSurvey(context);
        });
      })
    ],);
  }

  customAction({required BuildContext context,required VoidCallback onTab, required String svgPath, required String text}){
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 55,
        width: context.mediaQueryWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:AppColors.fieldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.cardBorderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImageWidget(svgPath: svgPath,color: null),
            SizedBox(width: 12),
            Text(text,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),

          ],
        ),
      ),
    );
  }
  onNewSurvey(BuildContext context){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        transitionAnimationController: newSurveysAlertController,
        builder: (BuildContext context) {
          return  NewSurveysAleart();
        }
    );
  }
}
