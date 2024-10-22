import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/new_surveys_aleart.dart';

import '../../../configs/components/loading_widget.dart';




class BottomNavBarWidget extends StatelessWidget {
  final PageController pageController;
  final AnimationController newSurveysAlertController;

  const BottomNavBarWidget({super.key, required this.pageController, required this.newSurveysAlertController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Container(
          height: 65,
          width: context.mediaQueryWidth,
          margin:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          decoration: BoxDecoration(
              color: Colors.white,
            // border: Border.all(color: AppColors.cardBorderColor),
            borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(15)),
            boxShadow:const [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.grey,
                blurStyle: BlurStyle.inner
              )
            ]
          ),
          child: ClipRRect(
            borderRadius:  BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(15)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: state.currentIndex,
              showUnselectedLabels: true,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              selectedLabelStyle:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.primaryColor,fontSize: 14,fontWeight: FontWeight.w600),
              unselectedLabelStyle:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.secondaryTextColor,fontSize: 14,fontWeight: FontWeight.w600),
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.secondaryTextColor,
              selectedIconTheme:const IconThemeData(color: AppColors.primaryColor),
              unselectedIconTheme:const IconThemeData(color: AppColors.secondaryTextColor),
              onTap: (index)async {
                pageController.animateToPage(index,duration:const Duration(milliseconds: 2), curve: Curves.easeInCubic);
                context.read<DashboardBloc>().add(CurrentIndexChange(currentIndex: index));
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgImageWidget(svgPath: AssetsPath.homeNavBarIcon,color:state.currentIndex==0? AppColors.primaryColor:AppColors.secondaryTextColor),
                  label:  AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon:SvgImageWidget(svgPath: AssetsPath.listsNavBarIcon,color:state.currentIndex==1? AppColors.primaryColor:AppColors.secondaryTextColor),
                  label: AppLocalizations.of(context)!.lists,
                ),
                BottomNavigationBarItem(
                  icon:SvgImageWidget(svgPath: AssetsPath.alertsNavBarIcon,color: state.currentIndex==2? AppColors.primaryColor:AppColors.secondaryTextColor),
                  label:  AppLocalizations.of(context)!.alerts,
                ),
                BottomNavigationBarItem(
                  icon: SvgImageWidget(svgPath: AssetsPath.helpNavBarIcon,color: state.currentIndex==3? AppColors.primaryColor:AppColors.secondaryTextColor),
                  label: AppLocalizations.of(context)!.help,
                ),
              ],
            ),
          ),
        );
      },

    );
  }
  onNewSurvey(BuildContext context){
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        transitionAnimationController: newSurveysAlertController,
        builder: (BuildContext context) {
          return  NewSurveysAleart();
        }
    );
  }
}
