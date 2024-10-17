import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/views/Lists/widget/scan_to_seasch.dart';

class ImageCaptureWidget extends StatelessWidget {
  const ImageCaptureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showImageSourceDialog(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryColor,
        ),
        child: SvgImageWidget(svgPath: AssetsPath.captureIcon,color: null),
      ),
    );
  }
}
