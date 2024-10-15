import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

// class StorageServices{
//   Future<void> requestStoragePermission() async {
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       await Permission.storage.request();
//     }
//   }


  // Future<void> loadFileFromSdCard() async {
  //   // Request storage permission
  //   await requestStoragePermission();
  //
  //   // Path to the SD card (this may vary, adjust based on your device)
  //   String sdCardPath = '/storage/self/primary/Pickcel';
  //
  //   // Path to your specific file
  //   String filePath = p.join(sdCardPath, 'output.json');
  //   String? paths = await getSdCardPath();
  //   log("paths: $paths");
  //
  //   File file = File(filePath);
  //
  //   if (await file.exists()) {
  //     log("File found at: $filePath");
  //     String content = await file.readAsString();
  //     log("File content: $content");
  //   } else {
  //     log("File not found at: $filePath");
  //   }
  // }

//   Future<String?> getSdCardPath() async {
//     List<Directory> storageList = Directory('/storage').listSync().whereType<Directory>().toList();
//     for (var dir in storageList) {
//       // Skip internal storage (usually /storage/emulated)
//       if (!dir.path.contains('emulated')) {
//         return dir.path;
//       }
//     }
//     return null;  // No SD card found
//   }
// }