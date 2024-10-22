import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

class VoiceSearchWidget extends StatelessWidget {
  const VoiceSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        // await DatabaseHelper.instance.searchObjectsWithRawQuery("Uganda").then((onValue){
        //   onValue.forEach((action){
        //     DatabaseClass databaseClass =action;
        //     print('%%%%%%%%%${databaseClass.toString()}');
        //   });
        // });
        // await DatabaseHelper.instance.deleteAllObjectsRaw();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.textFieldColor,
          border: Border.all(color: AppColors.cardBorderColor)
        ),
        child: SvgImageWidget(svgPath: AssetsPath.voiceIcon,color: null),
      ),
    );
  }
}
