import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardBarWidget extends StatelessWidget {
  const DashboardBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppLocalizations.of(context)!.dashboard,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
        SizedBox(width: 8),
        SvgImageWidget(svgPath: AssetsPath.dashboardIcon,color: null),
      ],
    );
  }
}
