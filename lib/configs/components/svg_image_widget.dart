import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';

class SvgImageWidget extends StatelessWidget {
  final String svgPath;
  final Color? color;
  const SvgImageWidget({required this.svgPath, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        svgPath,
        color:color??null,
    );
  }
}
