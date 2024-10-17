import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:share_plus/share_plus.dart';

class ShareWidget extends StatefulWidget {
  final String name;
  // final String dob;
  final String voterId;
  final String age;
  final String sex;
  final String imagePath;
  final String booth;
  final String boothAddress;

  const ShareWidget({super.key, required this.name, required this.voterId, required this.age, required this.sex, required this.imagePath, required this.booth, required this.boothAddress});

  @override
  State<ShareWidget> createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _captureAndSavePng(bool  showToken) async {
    try {

      showCustomLoader(context, 55);
      // Request storage permissions (important for Android 10 and above)
      // if (await Permission.storage.request().isGranted) {
        RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        // Get the path to the Downloads directory (Android)
        final directory = Directory('/storage/emulated/0/Download');
        if (!(await directory.exists())) {
          await directory.create(recursive: true);
        }
        final filePath = '${directory.path}/banner.png';
        final file = File(filePath);
        await file.writeAsBytes(pngBytes);
        stopCustomLoader(context);
        print('Saved to: $filePath');
        if(showToken){
          context.flushBarSuccessMessage(message: "File has been downloaded");
        }

      // } else {
      //   await Permission.storage.request();
      //   stopCustomLoader(context);
      //   print('Permission denied');
      //   throw Exception("Permission not granted");
      // }
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
     return InkWell(
      focusColor: AppColors.transparent,
      hoverColor:AppColors.transparent,
      splashColor: AppColors.transparent,
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        height: context.mediaQueryHeight,
        width: context.mediaQueryWidth,
        child: Center(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.cardBorderColor)
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    RepaintBoundary(
                      key: _globalKey,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.cardBorderColor)
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            hiperText(title: AppLocalizations.of(context)!.name,subtitle: widget.name,context: context),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(

                                  child: hiperText(title: AppLocalizations.of(context)!.age,subtitle: widget.age,context: context),),

                                Expanded(child: hiperText(title: AppLocalizations.of(context)!.booth,subtitle: widget.booth,context: context,color: AppColors.primaryColor),),
                                Expanded(child: hiperText(title:AppLocalizations.of(context)!.gender,subtitle: widget.sex,context: context),),

                              ],),
                            SizedBox(height: 12),
                            hiperText(title: AppLocalizations.of(context)!.voterId,subtitle: widget.voterId,context: context),

                            SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.boothAddres,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
                              Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
                              Expanded(child: Text(widget.boothAddress,maxLines: 5, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color:AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,))),
                            ],),

                            SizedBox(height: 30),
                            Container(
                              child: new Image.asset('assets/banner.png',
                                width: context.mediaQueryWidth,
                                height: 150.0,
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(children: [
                      Expanded(child:  InkWell(
                        onTap:(){
                          _captureAndSavePng(true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(color: AppColors.cardBorderColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgImageWidget(svgPath: AssetsPath.download,color: null),
                              SizedBox(width: 8),
                              Text(AppLocalizations.of(context)!.download,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.secondaryTextColor,fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(width: 12),
                      Expanded(child:  InkWell(
                        onTap: ()async{
                          final directory = Directory('/storage/emulated/0/Download');
                          if (!(await directory.exists())) {
                            await directory.create(recursive: true);
                          }else{
                            _captureAndSavePng(false);
                          }
                          final filePath = '${directory.path}/banner.png';
                          final result = await Share.shareXFiles([XFile(filePath)], text: '');
                          if (result.status == ShareResultStatus.success) {
                            print('Thank you for sharing the picture!');
                          }


                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgImageWidget(svgPath: AssetsPath.shareIcon,color: null),
                              SizedBox(width: 8),
                              Text(AppLocalizations.of(context)!.share,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),

                            ],
                          ),
                        ),
                      ))
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );




  }

  hiperText({required String title,required String subtitle,required BuildContext context,Color? color}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700)),
        Text(" : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
        Expanded(child: Text(subtitle,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color:color?? AppColors.secondaryTextColor,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,))),
      ],);
  }
}



