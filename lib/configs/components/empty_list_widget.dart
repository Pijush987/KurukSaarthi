import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import '../color/color.dart';

class EmptyListWidget extends StatelessWidget {

  final bool isRefresh;
  final VoidCallback? onTab;

  const EmptyListWidget({super.key,   this.isRefresh = false,   this.onTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.doc_text_search,
                color: AppColors.primaryColor,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(AppLocalizations.of(context)!.noResultFound, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
                ),
              ),
              if(isRefresh == true)
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                  onTap:onTab,
                  child: Container(
                    width: context.mediaQueryWidth*0.5,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgImageWidget(svgPath: AssetsPath.reloadIcon,color: AppColors.primaryColor),
                        const SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.refresh,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.primaryColor,fontWeight: FontWeight.w600)),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}