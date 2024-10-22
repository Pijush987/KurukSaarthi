
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';

import '../configs/color/color.dart';
import '../configs/components/svg_image_widget.dart';
import '../utils/const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnimatedSyncButton extends StatefulWidget {
  final VoidCallback onTap;

  const AnimatedSyncButton({super.key, required this.onTap});

  @override
  _AnimatedSyncButtonState createState() =>
      _AnimatedSyncButtonState();
}

class _AnimatedSyncButtonState extends State<AnimatedSyncButton> {
  bool isAnimating = false;
  Timer? _timer;
  List<Color> gradientColors = [AppColors.primaryColor, AppColors.primaryColor];
  double shadowBlurRadius = 0.0;
  double spreadRadius = 0.0;
  Color shadowColor = Colors.transparent;

  void startAnimation() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(mounted){
        setState(() {
          gradientColors = gradientColors[0] == AppColors.primaryColor
              ? [AppColors.primaryColor.withOpacity(0.3), Color(0xffF47216)]
              : [Color(0xffF47216),AppColors.primaryColor.withOpacity(0.5)];

          // Toggle shadow properties
          shadowBlurRadius = shadowBlurRadius == 0.0 ? 3.0 : 0.0;
          spreadRadius = spreadRadius == 0.0 ? 3.0 : 0.0;
          shadowColor = shadowColor == Color(0xffF47216)
              ?Color(0xffF47216)
              : Color(0xffF47216);
        });
      }
    });
  }

  void stopAnimation() {
    _timer?.cancel();
    if(mounted){
      setState(() {
        gradientColors = [Color(0xff808080), Color(0xff808080)]; // Reset to initial colors
        shadowBlurRadius = 0.0; // Reset shadow properties
        spreadRadius = 0.0; // Reset shadow properties
        shadowColor = Colors.transparent;
      });
    }
  }

  void toggleAnimation(bool animate) {
    if (animate) {
      startAnimation();
    } else {
      stopAnimation();
    }
    if(mounted){
      setState(() {
        isAnimating = animate;
      });
    }
  }


  @override
  void initState() {
    super.initState();

    if(isDataSync.value == true){
      _update(true);
    }else{
      _update(false);
    }
    isDataSync.addListener((){
      if(isDataSync.value == true){
        _update(true);
      }else{
        _update(false);
      }
    });
  }

  void _update(bool isStart) async {
    toggleAnimation(isStart);
  }



  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:isDataSync.value? widget.onTap:null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: shadowBlurRadius,
                spreadRadius: spreadRadius,
                offset: Offset(0, 0),
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImageWidget(svgPath: AssetsPath.reloadIcon,color: null),
              SizedBox(width: 4),
              Text(AppLocalizations.of(context)!.syncNow,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),

            ],
          ),
        ),
      ),
    );
  }
}