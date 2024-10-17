import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/chose_voter_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VoterItem extends StatelessWidget {
  final String name;
  final String region;
  final String voterIDNumber;
  final String voterId;
  final String age;
  final String selectedSurvey;
  final int index;
  final String sex;
  final VoidCallback onShare;
  const VoterItem({super.key, required this.name,required this.selectedSurvey, required this.region, required this.voterId, required this.age, required this.sex, required this.onShare, required this.index, required this.voterIDNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.cardBorderColor)
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hiperText(title: AppLocalizations.of(context)!.name,subtitle: name,context: context),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hiperText(title:AppLocalizations.of(context)!.gender,subtitle: region,context: context),
              hiperText(title: AppLocalizations.of(context)!.age,subtitle: age,context: context),
              hiperText(title: AppLocalizations.of(context)!.gender,subtitle: sex,context: context),
            ],),
          SizedBox(height: 12),
          hiperText(title: AppLocalizations.of(context)!.voterId,subtitle: voterId,context: context),
          SizedBox(height: 18),
          Container(
            margin: EdgeInsets.only(right: 80),
              child: ChoseVoterWidget(selectedSurvey: selectedSurvey.isEmpty?'':selectedSurvey, index: index, voterIDNumber: voterIDNumber,))
        ],
      ),
    );
  }
  hiperText({required String title,required String subtitle,required BuildContext context}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
        Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
        Text(subtitle,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w700)),
      ],);
  }
}
