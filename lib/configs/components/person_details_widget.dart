import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

class PersonDetailsWidget extends StatelessWidget {
  final String name;
  final String dob;
  final String voterId;
  final String age;
  final String sex;
  final String booth;
  final VoidCallback onShare;
  const PersonDetailsWidget({super.key, required this.name, required this.dob, required this.voterId, required this.age, required this.sex, required this.onShare, required this.booth});

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
          // hiperText(title: "Name",subtitle: name,context: context),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
            Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
            Expanded(child: Text(name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis))),
          ],),
          
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Age",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
                  Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
                  Text(age,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis)),
                ],),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
                  Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
                  Text(sex,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis)),
                ],),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Booth",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
                  Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
                  Text(booth,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis)),
                ],),

              // hiperText(title: "DOB",subtitle: dob,context: context),
              // hiperText(title: "Age",subtitle: age,context: context),
              // hiperText(title: "Gender",subtitle: sex,context: context),
              // hiperText(title: "Voter ID",subtitle: voterId,context: context),
          ],),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Voter ID",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
              Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
              Expanded(child: Text(voterId,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis))),
            ],),
          // SizedBox(height: 12),
          // hiperText(title: "Voter ID",subtitle: voterId,context: context),
          SizedBox(height: 18),
          InkWell(
            onTap: onShare,
            child: Container(
              alignment: Alignment.center,
              width: 90,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgImageWidget(svgPath: AssetsPath.shareIcon,color: null),
                  SizedBox(width: 8),
                  Text("Share",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),

                ],
              ),
            ),
          )
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
