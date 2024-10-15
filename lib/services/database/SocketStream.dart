//
// import 'dart:developer';
//
// import 'package:flutter/services.dart';
//
// class SocketStream {
//   static const platform = MethodChannel('com.example.dataStream/socket');
//
//   // This function returns a Stream and should be marked with async* for async generator
//   Stream<List<dynamic>> getDataStream() async* {
//     log("initSocket.........");
//     List<dynamic> list = [];
//     try {
//         await platform.invokeMethod('initSocket');
//         log("initSocket.........1");
//         // This listens for incoming data asynchronously
//         platform.setMethodCallHandler((call) async {
//           log("initSocket.........3");
//           if (call.method == "sendData") {
//             log("initSocket.........4 ${call.arguments}");
//             // Use yield* to emit incoming data to the stream
//             list=[];;
//             list= call.arguments;
//           }
//         });
//         yield ["Eli Richardson", "Stella Howard", "Caleb Kim", "Ellie Flores", "Nathan Cooper", "Aurora Ward", "Andrew Carter", "Addison Bailey", "Dylan Brooks", "Hazel Bennett"];
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }