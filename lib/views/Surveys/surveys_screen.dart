import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/empty_list_widget.dart';
import 'package:kuruk_saarthi/configs/components/person_details_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/confirmation_widget.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/survey_track_widget.dart';
import 'package:kuruk_saarthi/views/Surveys/widgets/voter_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../configs/components/loading_widget.dart';
import '../../services/session_manager/session_controller.dart';

class SurveysScreen extends StatefulWidget {
  const SurveysScreen({super.key});

  @override
  State<SurveysScreen> createState() => _SurveysScreenState();
}

class _SurveysScreenState extends State<SurveysScreen> with TickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();
  late AnimationController pushController;
  SurveysBloc _surveysBloc = SurveysBloc(surveyApiRepository: getIt());
  ScrollController _scrollController = ScrollController();
  String boothNo = "";
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushController = BottomSheet.createAnimationController(this);
    pushController.duration = const Duration(milliseconds: 500);
    pushController.reverseDuration = const Duration(milliseconds: 500);
    pushController.drive(CurveTween(curve: Curves.easeIn));
    _surveysBloc.add(FetchSurveyList());

    Constant.loading.addListener((){
      if(Constant.loading.value == "StopLoading"){
        Navigator.pop(context);
      }
      if(Constant.loading.value == "ShowLoading"){
        showCustomLoader(context,50);
      }
    });
    Constant.countListinear.addListener((){
      if(Constant.countListinear.value ==10){
        context.read<SurveysBloc>().add(SurveyManage());
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _surveysBloc.add(FetchSurveyList());

      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_)async{
      var ls = await SessionController().sharedPreferenceClass.readValue('boothNo');
      boothNo = ls;
      print("$ls  ***");
      setState(() {});
    });
  }
  Future<void> _onRefresh()async{
    _surveysBloc.add(FetchSurveyList(refresh: true));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pushController.dispose();
    _surveysBloc.close();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Constant.sideHorizontalPadding),
            child: Container(
              color: Colors.transparent,
              height: context.mediaQueryHeight,
              child: Form(
                key: _formKey,
                child:Column(
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 12),
                              Text(AppLocalizations.of(context)!.trackSurvey,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                            ],),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.boothNumber,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                            Text(" $boothNo",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.w600),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    BlocConsumer<SurveysBloc, SurveysState>(
                        bloc: _surveysBloc,
                        buildWhen: (current, previous) {
                          print(current.postApiStatus);
                          print(previous.postApiStatus);
                          return true;
                        } ,
                        listener: (context, state) {
                          log("%%%%%%%%%%%%%%%"+state.postApiStatus.toString());

                        },
                        builder: (context, state) {
                          if (state.postApiStatus == PostApiStatus.loading) {
                            return   Expanded(
                                child: Center(child: CircularProgressIndicator())
                            );
                          }
                          else if (state.postApiStatus == PostApiStatus.success) {
                            return state.allSurvey.isEmpty?
                            Expanded(child: Center(child: EmptyListWidget())):
                            Expanded(child:RefreshIndicator(
                              onRefresh: _onRefresh,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(AppLocalizations.of(context)!.votersList,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      controller: _scrollController,
                                      child: Column(
                                        children: [
                                          ListView.separated(
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (context,index){
                                                final survey = state.allSurvey[index];
                                                return VoterItem(voterId: survey.voterIDNumber, name: survey.name,region: survey.region,age: survey.age.toString(),sex: survey.gender,onShare: (){
                                                }, selectedSurvey: survey.pollStatus,index: index, voterIDNumber: survey.voterIDNumber,);
                                              }, separatorBuilder: (context,index){
                                            return SizedBox(height: 12);
                                          }, itemCount: state.allSurvey.length),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if(state.isLoading)
                                    Container(
                                      height: 50,
                                      color: AppColors.transparent,
                                      child: SpinKitThreeBounce(
                                        size: 30,
                                        itemBuilder: (BuildContext context, int index) {
                                          return DecoratedBox(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: index.isEven ? AppColors.primaryColor : Colors.green,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                ],
                              ),
                            ));
                          }
                          else if (state.postApiStatus == PostApiStatus.error) {
                            return Center(child: Text(state.message));
                          }
                          else {
                            return Expanded(
                              child: Center(child: EmptyListWidget()),
                            );
                          }
                        })
                  ],
                ),

              ),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        focusColor: AppColors.transparent,
        hoverColor:AppColors.transparent,
        splashColor: AppColors.transparent,
        foregroundColor: AppColors.transparent,
        extendedPadding: EdgeInsets.zero,
        elevation: 0,
        onPressed: (){
          isloading=true;
          log(_surveysBloc.selectedSurveys.toString());
          context.read<SurveysBloc>().add(SurveyManage());
          Constant.loading.value = "ShowLoading";
          // _surveysBloc.add(FetchSurveyList());
        },
        label:BlocConsumer<SurveysBloc, SurveysState>(
          buildWhen: (c,p)=>c.postApiStatus != p.postApiStatus,
          listener: (context, state) {

            if (state.postApiStatus == PostApiStatus.loading) {
            }
            if (state.postApiStatus == PostApiStatus.error) {
              context.flushBarErrorMessage(message: AppLocalizations.of(context)!.something_want_to_wrong_try_again);
              context.read<SurveysBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
            }
            if (state.postApiStatus == PostApiStatus.success) {
              context.flushBarSuccessMessage(message: state.message.toString());
              context.read<SurveysBloc>().add(StatusChange(postApiStatus: PostApiStatus.initial));
            }

          },
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgImageWidget(svgPath: AssetsPath.push,color: null),
                  const SizedBox(width: 6),
                  Text(AppLocalizations.of(context)!.forcePush,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
  AlertDialog alert = AlertDialog(
      iconPadding:EdgeInsets.zero,
      backgroundColor: AppColors.whiteColor,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: ConfirmationWidget()
  );
}
