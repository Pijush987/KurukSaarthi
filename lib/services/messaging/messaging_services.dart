import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kuruk_saarthi/services/database/database_services.dart';
import 'package:kuruk_saarthi/utils/const.dart';

class MessagingService {
  static String? fcmToken; // Variable to store the FCM token

  static final MessagingService _instance = MessagingService._internal();

  factory MessagingService() => _instance;

  MessagingService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initial() async{
    AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  showNotification(RemoteMessage message) async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        "channelId",
        "channelName",
        channelDescription: "channelDescription",
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker'
    );
    int notificationId = 1;
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(notificationId, message.notification!.title, message.notification!.body, notificationDetails,payload: 'Not present');
  }



  Future<void> init(BuildContext context) async {
    // Requesting permission for notifications
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint('User granted notifications permission: ${settings.authorizationStatus}');

    // Retrieving the FCM token
    fcmToken = await _fcm.getToken();
    log('fcmToken: $fcmToken');

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.instance.subscribeToTopic("all");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{

      if(message.notification != null){
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${message.notification!.title.toString()}');
        debugPrint('Message data: ${message.notification!.body.toString()}');
        debugPrint('Notify333 ${message.data}');

        final dbHelper = DatabaseHelper();
        String currentDate = DateTime.now().toString();
        var now = Jiffy.parse(currentDate.toString()).format(pattern: 'MMMM do yyyy, h:mm a');


        await dbHelper.insertNotification(message.notification!.body.toString(), now).whenComplete((){
          notificationNotifier.value = now.toString();
        });
        if(message.data['sync_enabled'] == "true"){
          isDataSync.value = true;
        }
      }

      if (message.notification != null) {
        if (message.notification!.title != null &&
            message.notification!.body != null) {
          final notificationData = message.data;
          final screen = notificationData['screen'];
          if (context.mounted) {
            showNotification(message);
          }
        }
      }
    });



    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null && context.mounted) {
        _handleNotificationClick(context, message);
      }
    });

    if (context.mounted) {
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint(
            'onMessageOpenedApp: ${message.notification!.title.toString()}');
        if (context.mounted) {
          _handleNotificationClick(context, message);
        }
      });
    }
  }

  void _handleNotificationClick(BuildContext context, RemoteMessage message) {
    final notificationData = message.data;

    if (notificationData.containsKey('screen')) {
      final screen = notificationData['screen'];
      Navigator.of(context).pushNamed(screen);
    }
  }

  Future<void> uploadFCMToken() async{
    String udid = await FlutterUdid.consistentUdid;

    try{
      await FirebaseMessaging.instance.getToken().then((token)async{
        log('fcmToken//: $token');
        await firebaseFirestore.collection('users').doc(udid).set({
          'notificationToken':token
        });
      });
      await FirebaseMessaging.instance.onTokenRefresh.listen((token)async{
        log('onTokenRefresh//: $token');
        await firebaseFirestore.collection('users').doc(udid).set({
          'notificationToken':token
        });
      });
    } catch(e){
      debugPrint("Exception ${e.toString()}");
    }
  }

}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message: ${message.notification!.title}');
}
final firebaseFirestore = FirebaseFirestore.instance;
