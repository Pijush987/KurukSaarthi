
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationBarWidget extends StatelessWidget {
  const NotificationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(AppLocalizations.of(context)!.notifications,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
          SizedBox(width: 16),
          SvgImageWidget(svgPath: AssetsPath.notificationIcon,color: null)
        ],)),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          SvgImageWidget(svgPath: AssetsPath.plusCircleIcon,color: null),
          SizedBox(width: 8),
          Text("${AppLocalizations.of(context)!.show_all} (${6})",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600),)
        ],))
      ],
    );
  }
}
