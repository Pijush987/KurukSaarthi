import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/model/login_model/login_model.dart';
import '../storage/local_storage.dart';

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();

  /// Singleton instance of [SessionController].
  static final SessionController _session = SessionController._internal();

  static bool? isLogin;
  static LoginModel user = LoginModel();
  static int? count ;
  static int? totalVoters ;

  static String? lastSync;

  static String? boothNo ;
  static String? boothInchargeId ;

  static double? totalSurvey;
  static double? partyPositive;
  static double? partyNagetive;
  static double? dead;
  static double? neutral ;

  /// Private constructor for creating the singleton instance of [SessionController].
  SessionController._internal() {
    isLogin = false;
  }

  /// Factory constructor for accessing the singleton instance of [SessionController].
  factory SessionController() {
    return _session;
  }


  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    sharedPreferenceClass.setValue('isLogin', 'true');
  }

  Future<void> saveTotalCount(int count) async {
    sharedPreferenceClass.setValue('count', count.toString());
  }
  Future<void> getTotalCount() async {
    try {
      var count = await sharedPreferenceClass.readValue('count');
      SessionController.count = int.parse(count);
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> saveBoothNo(String value) async {
    sharedPreferenceClass.setValue('boothNo', value.toString());
  }
  Future<void> getBoothNo() async {
    try {
      var boothNo = await sharedPreferenceClass.readValue('boothNo');
      SessionController.boothNo = boothNo;
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> saveBoothInchargeId(String value) async {
    sharedPreferenceClass.setValue('boothInchargeId', value.toString());
  }
  Future<void> getBoothInchargeId() async {
    try {
      var boothInchargeId = await sharedPreferenceClass.readValue('boothInchargeId');
      SessionController.boothInchargeId = boothInchargeId;
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> saveTotalVoters(int totalVoters) async {
    sharedPreferenceClass.setValue('totalVoters', totalVoters.toString());
  }
  Future<void> getTotalVoters() async {
    try {
      var totalVoters = await sharedPreferenceClass.readValue('totalVoters');
      SessionController.totalVoters = int.parse(totalVoters);
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> saveLastSync(String lastSync) async {
    sharedPreferenceClass.setValue('lastSync', lastSync.toString());
  }
  Future<void> getLastSync() async {
    try {
      var lastSync = await sharedPreferenceClass.readValue('lastSync');
      SessionController.lastSync = lastSync;
    } catch (e) {
      debugPrint(e.toString());
    }

  }



  Future<void> saveSurvey(double value) async {
    sharedPreferenceClass.setValue('totalSurvey', value.toString());
  }
  Future<void> getSurvey() async {
    try {
      var totalSurvey = await sharedPreferenceClass.readValue('totalSurvey');
      SessionController.totalSurvey = double.parse(totalSurvey);
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> savePartyPositive(double values) async {
    sharedPreferenceClass.setValue('partyPositive', values.toString());
  }
  Future<void> getPartyPositive() async {
    try {
      var partyPositive = await sharedPreferenceClass.readValue('partyPositive');
      SessionController.partyPositive = double.parse(partyPositive);
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> savePartyNagetive(double value) async {
    sharedPreferenceClass.setValue('partyNegitive', value.toString());
  }
  Future<void> getPartyNagetive() async {
    try {
      var partyNegitive = await sharedPreferenceClass.readValue('partyNegitive');
      SessionController.partyNagetive =  double.parse(partyNegitive);
    } catch (e) {
      debugPrint(e.toString());
    }

  }

  Future<void> saveDead(double value) async {
    sharedPreferenceClass.setValue('dead', value.toString());
  }
  Future<void> getDead() async {
    try {
      var dead = await sharedPreferenceClass.readValue('dead');
      SessionController.dead = double.parse(dead);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> saveNeutral(double value) async {
    sharedPreferenceClass.setValue('neutral', value.toString());
  }
  Future<void> getNeutral() async {
    try {
      var neutral = await sharedPreferenceClass.readValue('neutral');
      SessionController.neutral = double.parse(neutral);
    } catch (e) {
      debugPrint(e.toString());
    }

  }
  Future<void> removeUserInPreference() async {
    sharedPreferenceClass.setValue('token','');
    sharedPreferenceClass.setValue('isLogin', 'false');
  }


  Future<void> getUserFromPreference() async {
    try {
      var userData = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController.user = LoginModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
