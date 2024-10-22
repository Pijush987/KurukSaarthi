import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kuruk_saarthi/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:kuruk_saarthi/bloc/home_bloc/home_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/components/empty_list_widget.dart';
import 'package:kuruk_saarthi/configs/components/svg_image_widget.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/utils/assets_path.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:kuruk_saarthi/utils/enums.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:kuruk_saarthi/views/Surveys/survey_track_widget.dart';

class SurveysScreen extends StatefulWidget {
  const SurveysScreen({super.key});

  @override
  State<SurveysScreen> createState() => _SurveysScreenState();
}

class _SurveysScreenState extends State<SurveysScreen> {
  SurveysBloc _surveysBloc = SurveysBloc(surveyApiRepository: getIt());
  final _formKey = GlobalKey<FormState>();
  ScrollController _scrollController = ScrollController();
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _surveysBloc.add(FetchSurveyList());



    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _surveysBloc.add(FetchSurveyList());

      }
    });
  }

  Future<void> _onRefresh()async{
    _surveysBloc.add(FetchSurveyList(refresh: true));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgImageWidget(svgPath: AssetsPath.backArrow,color: null),
                              const SizedBox(width: 16),
                              Text("${AppLocalizations.of(context)!.trackSurvey} ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,color: AppColors.blackColor,fontWeight: FontWeight.w600),),
                            ],),
                        ),
                        InkWell(
                          onTap: (){
                            _surveysBloc.add(FetchSurveyList(refresh: true));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgImageWidget(svgPath: AssetsPath.reloadIcon,color: null),
                                const SizedBox(width: 8),
                                Text(AppLocalizations.of(context)!.refresh,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14,color: AppColors.whiteColor,fontWeight: FontWeight.w600)),

                              ],
                            ),
                          ),
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
                            if(state.message =="420"){
                              print("session expire");Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
                              context.read<DashboardBloc>().add(CurrentIndexChange(currentIndex: 0));
                              context.flushBarErrorMessage(message: AppLocalizations.of(context)!.authentication_failed_try_logging_in_again);
                            }
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
                                                return SurveyTrackWidget(index: index.toString(), positive:survey.partyPlus.toString(), negitive: survey.partyMinus.toString(), dead: survey.dead.toString(), neutral: survey.neutral.toString(), total: survey.count.toString(), booth: survey.voterNo.toString(), inchargeName:survey.inchargeName.toString(), time: survey.updatedAt);

                                                // return VoterItem(voterId: survey.voterIDNumber, name: survey.name,region: survey.region,age: survey.age.toString(),sex: survey.gender,onShare: (){},

                                                // selectedSurvey: survey.pollStatus,index: index, voterIDNumber: survey.voterIDNumber,);
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

                  ],),
              ),
            ),
          ),
        )
    );
  }
}

