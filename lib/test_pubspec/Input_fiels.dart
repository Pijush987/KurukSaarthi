import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart' as pinput;
import 'package:syncfusion_flutter_sliders/sliders.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //         Center(
  //           child:pinput. Pinput(
  //           defaultPinTheme: defaultPinTheme,
  //           focusedPinTheme: focusedPinTheme,
  //           submittedPinTheme: submittedPinTheme,
  //           validator: (s) {
  //             return s == '2222' ? null : 'Pin is incorrect';
  //           },
  //           pinputAutovalidateMode:pinput. PinputAutovalidateMode.onSubmit,
  //           showCursor: true,
  //           onCompleted: (pin) => print(pin),
  //                   ),
  //         ),
  //           SizedBox(height: 50),
  //
  //       ],),
  //     ),
  //   );
  // }
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter Slider'),
      ),
      body: Row(
        children: [
          SfSlider(
            min: 0.0,
            max: 100.0,
            value: _value,
            interval: 20,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (dynamic value){
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

final defaultPinTheme = pinput. PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.orange),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Colors.orange),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: Color.fromRGBO(255, 16, 16, 1.0),
  ),
);

