import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/configs/routes/routes_name.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/services/session_manager/session_controller.dart';
import 'package:kuruk_saarthi/utils/extension/flush_bar_extension.dart';
import 'package:kuruk_saarthi/utils/extension/general_ectensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../bloc/surveys_bloc/surveys_bloc.dart';

class AnalyticsBarWidget extends StatefulWidget {



  const AnalyticsBarWidget({super.key});

  @override
  State<AnalyticsBarWidget> createState() => _AnalyticsBarWidgetState();
}

class _AnalyticsBarWidgetState extends State<AnalyticsBarWidget> {
  late TooltipBehavior _tooltip;
  List<_ChartData> _data = [];
  late double _totalSurvey;
  SurveysBloc _surveysBloc = SurveysBloc(surveyApiRepository: getIt());

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      _surveysBloc.add(SurveyStatic());
      Future.delayed(Duration(seconds: 3), () async{
        print("55555555555555555555555555");

        if(_surveysBloc.state.message =="420"){
          context.flushBarErrorMessage(message: AppLocalizations.of(context)!.your_token_has_been_expire_try_to_login_again);
          print("session expire");Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);

        }
        final PARTY_PLUS = await SessionController().sharedPreferenceClass.readValue('partyPositive');
        final PARTY_MINUS = await SessionController().sharedPreferenceClass.readValue('partyNegitive');
        final NEUTRAL = await SessionController().sharedPreferenceClass.readValue('neutral');
        final DEAD = await SessionController().sharedPreferenceClass.readValue('dead');
        final total = await SessionController().sharedPreferenceClass.readValue('totalSurvey');
        _data = [
          _ChartData('${AppLocalizations.of(context)!.party}+', double.parse(PARTY_PLUS),AppColors.primaryColor),
          _ChartData('${AppLocalizations.of(context)!.party}-', double.parse(PARTY_MINUS),AppColors.fieldBackgroundColor),
          _ChartData(AppLocalizations.of(context)!.death,  double.parse(DEAD),AppColors.fieldBackgroundColor),
          _ChartData(AppLocalizations.of(context)!.neutral, double.parse(NEUTRAL),AppColors.fieldBackgroundColor),
        ];
        _totalSurvey = double.parse(total);
        if(mounted){
          setState(() {});
        }
      });

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _surveysBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return _data.isEmpty?SizedBox(
    ): Column(
      children: [
        Container(
            width: context.mediaQueryWidth,
            height: context.mediaQueryHeight * 0.4,
            child: SfCartesianChart(
              plotAreaBackgroundColor: AppColors.whiteColor,
              primaryXAxis: CategoryAxis(axisLine: AxisLine(color: Colors.transparent,), isVisible: true,borderColor: Colors.transparent,),
              primaryYAxis: NumericAxis(minimum: 0, maximum: _totalSurvey, interval: 10000,axisLine: AxisLine(color: Colors.transparent), isVisible: true,),
              legend: Legend(isVisible: false),
              tooltipBehavior: _tooltip,
              series: <ColumnSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                  color: Colors.transparent,
                  borderRadius:BorderRadius.only(topRight: Radius.circular(6),topLeft: Radius.circular(6)) ,
                  dataSource: _data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  pointColorMapper: (_ChartData data, _)=>data.c,
                  // color:data. AppColors.primaryColor:AppColors.secondaryTextColor
                ),
              ],
            )
        ),
      ],
    );
  }
}
class _ChartData {
  _ChartData(this.x, this.y,this.c);

  final String x;
  final double y;
  final Color c;
}