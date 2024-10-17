import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SyncButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SyncButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImageWidget(svgPath: AssetsPath.reloadIcon,color: null),
            SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.syncNow,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),

          ],
        ),
      ),
    );
  }
}
