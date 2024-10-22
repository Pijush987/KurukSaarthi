import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuruk_saarthi/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:kuruk_saarthi/bloc/surveys_bloc/surveys_bloc.dart';
import 'package:kuruk_saarthi/configs/color/color.dart';
import 'package:kuruk_saarthi/main.dart';
import 'package:kuruk_saarthi/services/messaging/messaging_services.dart';
import 'package:kuruk_saarthi/views/Surveys/surveys_screen.dart';
import 'package:kuruk_saarthi/views/dashboard/widget/bottom_nav_bar_widget.dart';
import '../views.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin{
  late   PageController _pageController;
  late AnimationController newSurveysAlertController;
  final _messagingServices = MessagingService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    _messagingServices.init(context);
    _messagingServices.uploadFCMToken();
    _messagingServices.initial();

    newSurveysAlertController = BottomSheet.createAnimationController(this);
    newSurveysAlertController.duration = const Duration(milliseconds: 500);
    newSurveysAlertController.reverseDuration = const Duration(milliseconds: 500);
    newSurveysAlertController.drive(CurveTween(curve: Curves.easeIn));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
  List<Widget> _buildScreens() {
    return [
      // HomeScreen(),
      // SurveysScreen() ,
      // ListsScreen(),
      // AlertsScreen(),
      HomeScreen(),
      ListsScreen(),
      AlertsScreen(isBack: false,),
      HelpScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false ,// fluter 2.x
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body:  SizedBox.expand(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {},
            children: _buildScreens()
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(pageController: _pageController, newSurveysAlertController: newSurveysAlertController,)
    );
  }
}
