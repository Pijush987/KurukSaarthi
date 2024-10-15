import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class LocalNotificationServices{
  Future<void> requestPermission() async{
    PermissionStatus status = await Permission.notification.request();
    PermissionStatus status2 = await Permission.storage.request();
    PermissionStatus status3 =  await Permission.photos.request();;
    if(status != PermissionStatus.granted && status2 != PermissionStatus.granted && status3 != PermissionStatus.granted ){
      throw Exception("Permission not granted");
    }
  }

  Future<void> requestStoragePermissions() async {
    if (Platform.isAndroid) {
      // Request storage permissions based on Android version
      if (await Permission.photos.isDenied) {
        await Permission.photos.request(); // For images
      }
      if (await Permission.storage.isDenied) {
        await Permission.storage.request();
      }
      if (await Permission.manageExternalStorage.isDenied) {
        await Permission.manageExternalStorage.request();
      }
    }
  }
}

