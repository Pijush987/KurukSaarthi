
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/views/login/login_screen.dart';
import 'package:page_transition/page_transition.dart';


class PageTransitions extends StatelessWidget {
  const PageTransitions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){

         Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftJoined, child: LoginScreen(), childCurrent: this));

      }, child: Text("GO->"))),
    );
  }
}