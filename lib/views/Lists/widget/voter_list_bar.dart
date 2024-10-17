import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VoterListBar extends StatelessWidget {
  const VoterListBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.votersList,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
          ],)),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgImageWidget(svgPath: AssetsPath.filteredIcon,color: null),
            SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.sort,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),)
          ],))
      ],
    );
  }
}
