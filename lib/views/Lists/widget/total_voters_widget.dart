import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';

class TotalVotersWidget extends StatelessWidget {
  const TotalVotersWidget({super.key});

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
          Text("Total voters",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text("8,17,398",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28,color: AppColors.primaryColor,fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          Text("*As of 1 Oct, 2024",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic)),

        ],
      ),
    );
  }
}
