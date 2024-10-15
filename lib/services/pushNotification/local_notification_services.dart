import 'package:permission_handler/permission_handler.dart';

class LocalNotificationServices{
  Future<void> requestPermission() async{
    PermissionStatus status = await Permission.notification.request();
    if(status != PermissionStatus.granted){
      throw Exception("Permission not granted");
    }
  }
}