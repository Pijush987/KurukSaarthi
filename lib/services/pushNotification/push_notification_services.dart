import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicesControl;

class PushNotificationServices{
  static Future<String> getAccessToken() async
  {
    final servicesAccountJson =
    {
      "type": "service_account",
      "project_id": "kuruksaarthi-app",
      "private_key_id": "be365f943d6c25fbc3fe00422ae28c5518e8d224",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDKtQVMjZXOtsFt\nk3C1D9FeIIRwPXCmrHwrpJJVFKepPRwLgNt4ki793hW+ch9jMsZ6iCY/hmgiCPZk\nIgJIj+dU+jVoFlf9/nWrrFnMYNlNymAPt99PMTC8HcLynv+Ws+iYTJdjn19JtMKu\npb0VQP945jzk6S979V2ewg+FpNp2J05mccmYqYS0toFb/X6nwbwpm6P/OpK6zqBN\nXsWeBKyjRVdZwNCJ93x2f0dZWm3aTGW0c7R+o20GjkVIdlrB7JfLfANc1paICXKr\nn3JrcBcydP1ZOLSu+YfCnRUBOPdmMtirLyVfx85AFxeq/+Z5+fKYEjo6eb6HNkk2\nV1JWgBCRAgMBAAECggEAJ59RKRjO1NBjyEGm6PltzRaRlKfpzmaOQfCh+tf1+s57\nXiNCoxN99HkV6ns/t+HrqnVU9ptU3Pw//ywnopvgVbuvt0gQzJDR2uvuRJUUvNAn\nTUM9dusQUeEGY2rhXkmN2EE2YU58b3mSCVXTuyUQmsb0VbFf6vy330mjA5ZI7omg\nvAqgUJ3SIF8AjCChEIeOwxzcGfApYVkoaTmNii45SeQQf0HZ40g7Xrrv0e6jYnDE\n2bKwZUK6lI1yokoDaCaiVk50T+dv6nCeWPO7ocS8l5WzbAqrk6udG90NAF1rT3yJ\nq/xlELkeixpXrw24tLZEroXXZ7jkXG1oacATpibPPQKBgQDsMzBMTPBalKidOmMk\nCWmyhJSOj1OYK+wCTR4nsVELjq2gmTu10HDuFErG0KkF9rwErMqp0s/RipnpN6uL\nMnsKZ5B51WVd5x68Y6OKXXSL57qBQdR/uoobIC79uerS1/7SENM0vduD8dn8Uv+v\nPRVM2gEWQ2dzWrDph0haDC2g/QKBgQDbsxTMUArIyhDHy945zTgK3sizDMlPplnF\nhtSSuAsnnYvALZSk4Fyzn+JyYL7tvDPSg8Pg2cb9muETiz8Ipr00+3fHDXmWjkqD\nuvIB+U1Bp4nMb+svt5rrP6GHBpayOVMAuOIkOAYsmE/JPx9mjmnT8dM2Jje/OsYx\n7qrxJsa8JQKBgDX8QSa/UxQw9BTzmmNLL3hY6ydmROH77/Zar/C8i1yL4M1bGJWm\nrZkM1EZ6vJcbXL/oym1kPJGVDzaJvdCT2iF3qELgbkm3IIRIdcGTOKcdcLhIVoxX\nE2e9xF/DlZNZQOm8ZLmiR0DyDzOnuL7RxEOLdEIlZ8iqytKlU/kY3Xj1AoGAR4SW\nYqQzvoU4zTFqV/qcIb3AK7kf11PZqVlo3ZIX33+DvL2Zw8pdowOLHZysyosXe5H1\nM77w7iF633fWvyQ4N4UcyqlySTZsv1Ed8tKK+bJmQyyzrMbiIW6HUIMujznl8Tg+\nNXgfWmkCoApyWFpHzPzNurTaNOAXIK4G65Wp4BkCgYBTMC4+FTIc1L5BGiH7y6gk\nNHrFEVyPKUjrWmbXJXvvBpzv0IUmdQ7htD8Zz3C4Ur3tGuUFDErHx0fU7rge+TcX\nx4shxzX7Qw6WEb2aISJbwJv1cdWHK2EM4sklVbhXNVKoWaIB3SIdSRx0d5tbYQU/\n95sLW8SvfvQXxci8TZy1Cw==\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-5cgzl@kuruksaarthi-app.iam.gserviceaccount.com",
      "client_id": "112587375679514567802",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-5cgzl%40kuruksaarthi-app.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(servicesAccountJson),scopes,
    );

    //get access token


    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(servicesAccountJson)
        ,scopes,
        client
    );

    client.close();
    return credentials.accessToken.data;
  }

  static sendNotification(BuildContext context) async
  {
    final String  serverKey = await getAccessToken();
    final cloudMessagingEndPoint =  "https://fcm.googleapis.com/v1/projects/kuruksaarthi-app/messages:send";
    final Map<String, dynamic> message =
    {
      "message": {
        "token":'elOOyVSiSLaGOzIey20-2c:APA91bH_156Abo2bCbrITDAihWbWdmIpJwNJvgnYVaE4rI6jV-VyPKofo5Ba1vQBNy2omkE9wHo3UzdT5XybSK1WlmczhlBSzQjAQAlJHmL4hwFi8qK2t3ddPruIq13n4ixn46S8X37v',
        "notification": {
          "title": "Update new Data",
          "body": "Your data has been updated"
        },
        "data": {
          "story_id": "story_12345"
        }
      }
    };

    final http.Response response = await http.post(
      Uri.parse(cloudMessagingEndPoint),
      headers : <String, String >{
        'Content-Type':'application/json',
        'Authorization': 'Bearer $serverKey'
      },
      body:jsonEncode(message)
    );

    if(response.statusCode == 200){
      debugPrint("Notification send successfully");
    }else{
      debugPrint("Notification not send ${response.statusCode}");
      debugPrint("Notification not send ${response.body}");
    }
  }
}