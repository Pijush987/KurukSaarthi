import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_bloc.dart';
import 'package:kuruk_saarthi/bloc/list_bloc/lists_event.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/empty_list_widget.dart';
import 'package:kuruk_saarthi/configs/components/loading_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/test_pubspec/animated_button.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Home/widget/Age_dropdown.dart';
import 'package:kuruk_saarthi/views/Home/widget/action_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/analytics_bar_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/analytics_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/booth_dropdown_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/dashboard_bar_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/image_capture_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/language_selection_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/language_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/notification_bar_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/notification_list_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/search_textfromfield_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/sync_button_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/sync_last_update_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/tahsil_dropdown_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/total_voters_widget.dart';
import 'package:kuruk_saarthi/views/Home/widget/voice_search_widget.dart';
import 'package:kuruk_saarthi/views/Lists/widget/dashboard_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late AnimationController languageController;
  late AnimationController ageController;
  late AnimationController boothController;
  late AnimationController newSurveysAlertController;
  late AnimationController tahsilController;
  late RangeValues currentRangeValues ;
  final _searchFocusNode = FocusNode();
  late AnimationController notificationController;
  late AnimationController attachFilesController;
  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    super.initState();
    currentRangeValues = const RangeValues(18, 80);
    ageController = BottomSheet.createAnimationController(this);
    ageController.duration = const Duration(milliseconds: 500);
    ageController.reverseDuration = const Duration(milliseconds: 500);
    ageController.drive(CurveTween(curve: Curves.easeIn));

    attachFilesController = BottomSheet.createAnimationController(this);
    attachFilesController.duration = const Duration(milliseconds: 500);
    attachFilesController.reverseDuration = const Duration(milliseconds: 500);
    attachFilesController.drive(CurveTween(curve: Curves.easeIn));


    languageController = BottomSheet.createAnimationController(this);
    languageController.duration = const Duration(milliseconds: 500);
    languageController.reverseDuration = const Duration(milliseconds: 500);
    languageController.drive(CurveTween(curve: Curves.easeIn));

    boothController = BottomSheet.createAnimationController(this);
    boothController.duration = const Duration(milliseconds: 500);
    boothController.reverseDuration = const Duration(milliseconds: 500);
    boothController.drive(CurveTween(curve: Curves.easeIn));

    tahsilController = BottomSheet.createAnimationController(this);
    tahsilController.duration = const Duration(milliseconds: 500);
    tahsilController.reverseDuration = const Duration(milliseconds: 500);
    tahsilController.drive(CurveTween(curve: Curves.easeIn));

    notificationController = BottomSheet.createAnimationController(this);
    notificationController.duration = const Duration(milliseconds: 500);
    notificationController.reverseDuration = const Duration(milliseconds: 500);
    notificationController.drive(CurveTween(curve: Curves.easeIn));

    newSurveysAlertController = BottomSheet.createAnimationController(this);
    newSurveysAlertController.duration = const Duration(milliseconds: 500);
    newSurveysAlertController.reverseDuration = const Duration(milliseconds: 500);
    newSurveysAlertController.drive(CurveTween(curve: Curves.easeIn));


    isDataSync.addListener((){
      if(mounted){
        context.read<ListsBloc>().add(FetchLists(refresh: true));
      }
    });


    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    isDataSync.addListener((){
      if(isDataSync.value == true){
        deleteVoters();
      }
    });

  }

Future deleteVoters()async{
  final dbHelper = DatabaseHelper();
  await dbHelper.deleteAllVoters();

  await SessionController().saveTotalCount(1);
  await SessionController().getTotalCount();

  await SessionController().saveTotalVoters(0);
  await SessionController().getTotalVoters();

  await SessionController().saveLastSync('');
  await SessionController().getLastSync();


  if(mounted){
    setState(() {});
  }
}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchFocusNode.dispose();
    _animationController.dispose();
    ageController.dispose();
    boothController.dispose();
    tahsilController.dispose();
    languageController.dispose();
    newSurveysAlertController.dispose();
    attachFilesController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {

        if (state.postApiStatus == PostApiStatus.loading) {
          showSyncAlertDialog(context,50);
        }
        if (state.postApiStatus == PostApiStatus.error) {
          stopCustomLoader(context);
          context.flushBarErrorMessage(message: AppLocalizations.of(context)!.something_want_to_wrong_try_again);

          context.read<HomeBloc>().add(HomeStatusChange(postApiStatus: PostApiStatus.initial));
          if(state.message =="420"){
            print("session expire");Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
            context.read<DashboardBloc>().add(CurrentIndexChange(currentIndex: 0));
            context.flushBarErrorMessage(message: AppLocalizations.of(context)!.authentication_failed_try_logging_in_again);
          }
        }
        if (state.postApiStatus == PostApiStatus.success) {
          print("object ${state.message.toString()}");
          if(state.message.isEmpty){
            stopCustomLoader(context);
            context.flushBarSuccessMessage(message: AppLocalizations.of(context)!.syncSuccessful);
            setState(() {
              print("object ${state.message.toString()}");
            });
          }
        }
      },
  builder: (context, state) {
    return Scaffold(
        body: InkWell(
          hoverColor: AppColors.transparent,
          splashColor: AppColors.transparent,
          highlightColor:AppColors.transparent,
          onTap:(){
            if(_searchFocusNode.hasFocus){
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          },
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constant.sideHorizontalPadding),
                  child: Container(
                    color: Colors.transparent,
                    height: context.mediaQueryHeight,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(children: [
                          Expanded(child: Row(
                            children: [
                              SvgImageWidget(svgPath: AssetsPath.locationIcon,color: null),
                              const SizedBox(width: 12),
                              Text(AppLocalizations.of(context)!.bhandaraVidhanSabh,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w700,fontFamily: ''),),
                            ],
                          )),
                          LanguageWidget(
                            onTap: (){
                              onSelectLanguage();
                            },
                          )
                        ],),
                      ),
                      // const SizedBox(height: 12),
                      // Row(children: [
                      //   Expanded(child:  SearchTextFromFieldWidget(focusNode: _searchFocusNode,)),
                      //   const SizedBox(width: 12),
                      //   const VoiceSearchWidget(),
                      //   const SizedBox(width: 12),
                      //   const ImageCaptureWidget(),
                      //
                      // ],),
                      const SizedBox(height: 12),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Column(children: [
                            const SizedBox(height: 18),
                            const NotificationBarWidget(),
                            const SizedBox(height: 18),
                            const NotificationListWidget(),
                            const SizedBox(height:20),

                            // const ActionBarWidget(),
                            // const SizedBox(height:24),
                            // ActionWidget(notificationController: notificationController,attachFilesController: attachFilesController,formKey: _formKey,),
                            // const SizedBox(height:30),

                            const DashboardBarWidget(),
                            const SizedBox(height:14),
                            SizedBox(
                              height: 145,
                              child:   Row(children: [
                                Expanded(
                                    child: TotalVotersWidget(),
                                    flex:4
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                    flex:3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SyncLastUpdateWidget(),
                                        AnimatedSyncButton(onTap: (){
                                          context.read<HomeBloc>().add(FetchVoterList());
                                        },)
                                      ],
                                    ))
                              ],),
                            ),
                          //   const SizedBox(height:30),
                          //   const AnalyticsWidget(),
                          //   const SizedBox(height: 16),
                          //   BlocBuilder<SurveysBloc, SurveysState>(
                          //     builder: (context, state) {
                          //       return AnalyticsBarWidget();
                          //     },
                          //   ),
                          // const SizedBox(height: 150),
                          ],),
                        ),
                      ),


                    ],),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  },
);
  }
  openAgeBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: ageController,
        builder: (BuildContext context) {
          return AgeDropdown(onTap: () {  }, currentRangeValues: currentRangeValues,);

        }
    );
  }

  onSelectLanguage(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: languageController,
        builder: (BuildContext context) {
          return LanguageSelectionWidget(onTap: () {  },);

        }
    );
  }

  openBoothBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: boothController,
        builder: (BuildContext context) {
          return BoothDropdownWidget(onTap: () {  },);

        }
    );
  }
  openTahsilBottomSheet(){
    return showModalBottomSheet(
        context: context,
        transitionAnimationController: tahsilController,
        builder: (BuildContext context) {
          return TahsilDropdownWidget(onTap: () {  },);

        }
    );
  }
}