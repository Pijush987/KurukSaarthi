import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';

class SyncLastUpdateWidget extends StatelessWidget {
  const SyncLastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.fieldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Last synced",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text("1 Oct 2024, 5:27 PM",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w500)),

        ],
      ),
    );
  }
}
