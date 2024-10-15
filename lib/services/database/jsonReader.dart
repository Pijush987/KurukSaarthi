

import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'dart:isolate';

class JsonReaders{
  // void processFiles() async{
  //   Directory? downloadsDirectory = Directory('/storage/emulated/0/Download'); // Manually specifying the path for Android downloads folder.
  //   // downloadsDirectory = await getApplicationDocumentsDirectory(); // For iOS, use the app's document directory as there is no external downloads directory.
  //   final files = downloadsDirectory.listSync(); // List all files in the directory
  //
  //   if (files.isNotEmpty) {
  //     final jsonFile = File('${downloadsDirectory.path}/output.json');
  //     print('buffer size 1');
  //     if (jsonFile.existsSync()){
  //       print('buffer size 2');
  //       final reader = await jsonFile.openRead().transform(utf8.decoder).transform(JsonDecoder());
  //       print('buffer size 3');
  //       int bufferSize = 0;
  //       print('buffer size 4');
  //       List<DataEntry> bufferArray = [];
  //       print('buffer size 5');
  //       reader.listen((data) {
  //         print('buffer size 6');
  //         // Ensure the data is treated as a list
  //         if (data is List) {
  //           print('buffer size 7');
  //           for (var entry in data) {
  //             print('buffer size = $bufferSize');
  //             print('buffer entry = $entry');
  //             // final dataEntry = DataEntry.fromJson(jsonEncode(object));
  //             if (bufferSize < 1000) {
  //               // bufferArray.add(dataEntry);
  //               bufferSize++;
  //             } else {
  //               // bufferArray.clear();
  //               bufferSize = 0;
  //             }
  //           }
  //         } else {
  //           print('Unexpected JSON format: Expected a list.');
  //         }
  //       }, onDone: () {
  //         bufferArray.clear();
  //         bufferSize = 0;
  //       }, onError: (e) {
  //         print('Error reading JSON: $e');
  //       });
  //     } else {
  //       print('File not found: ${jsonFile.path}');
  //     }
  //   }
  // }
  // void processLargeJsonFile() async {
  //   Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
  //   final jsonFile = File('${downloadsDirectory.path}/output.json');
  //   // final jsonFile = File('path_to_your_large_json_file.json');
  //
  //   final inputStream = jsonFile.openRead()
  //       .transform(utf8.decoder)
  //       .transform(const LineSplitter());
  //
  //   final StreamQueue<String> queue = StreamQueue<String>(inputStream);
  //
  //   while (await queue.hasNext) {
  //     final line = await queue.next;
  //     final jsonObj = jsonDecode(line);
  //
  //     if (jsonObj is Map<String, dynamic>) {
  //       // DataEntry entry = DataEntry.fromJson(jsonObj);
  //       // Process the DataEntry object
  //       print('Data Entry: ${jsonObj}');
  //     }
  //   }
  // }

  void processFiles() async {
    Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
    final jsonFile = File('${downloadsDirectory.path}/jsonfile.json');
    // Check if the file exists before attempting to read
    if (await jsonFile.exists()) {
      // Open the file and read it as a string
      final fileStream = jsonFile.openRead();

      await fileStream
          .transform(utf8.decoder) // Decode bytes to UTF-8 strings
          .transform(json.decoder)  // Decode JSON strings to Dart objects
          .forEach((jsonObject) {
        // Check if the parsed object is a Map (for a typical JSON object)
        if (jsonObject is Map<String, dynamic>) {
          final data = DataEntry.fromJson(jsonObject);
          print('ID: ${data.id}, Key: ${data.key}, Region: ${data.region}');
        }
      });

      // Process each JSON object
      // await for (var jsonObject in fileStream) {
      //   if (jsonObject is Map<String, dynamic>) {
      //     final data = DataEntry.fromJson(jsonObject);
      //     print('ID: ${data.id}, Key: ${data.key}, Region: ${data.region}');
      //   }
      // }
    } else {
      print('File not found: ${jsonFile.path}');
    }
  }
  // void processFiles() {
  //   // final downloadsDirectory = Directory('path_to_downloads'); // Set the correct directory path
  //   // final files = downloadsDirectory.listSync(); // List all files in the directory
  //     Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
  //     final jsonFile = File('${downloadsDirectory.path}/output.json');
  //     // final jsonFile = File('${downloadsDirectory.path}/jsonfile.json');
  //
  //     if (jsonFile.existsSync()) {
  //       final inputStream = jsonFile.openRead();  // Open file as a stream of bytes
  //
  //       int bufferSize = 0;
  //       List<DataEntry> bufferArray = [];
  //
  //       inputStream
  //           .transform(utf8.decoder) // Decode bytes to UTF-8.
  //           // .transform(JsonDecoder())
  //           .transform(JsonDecoder(reviver))
  //           .listen((line) {
  //         try {
  //           // Convert each line (or batch of lines) into a DataEntry object
  //           final Map<String, dynamic> json = jsonDecode(line.toString());
  //           // final dataEntry = DataEntry.fromJson(json);
  //           print(" processing line: $json");
  //           if (bufferSize < 100) {
  //             // bufferArray.add(dataEntry);
  //             bufferSize++;
  //           } else {
  //             bufferArray.clear();
  //             bufferSize = 0;
  //           }
  //         } catch (e) {
  //           print("Error processing line: $e");
  //         }
  //       }, onDone: () {
  //         // Clean up when done
  //         bufferArray.clear();
  //         bufferSize = 0;
  //         print('Done processing file.');
  //       }, onError: (e) {
  //         print('Error reading JSON: $e');
  //       });
  //     } else {
  //       print('File not found: ${jsonFile.path}');
  //     }
  //   }
  }





class DataEntry {
  int id;
  String key;
  String region;

  // Constructor
  DataEntry({required this.id, required this.key, required this.region});

  // fromJson: A factory constructor to create an instance from a JSON map
  factory DataEntry.fromJson(Map<String, dynamic> json) {
    return DataEntry(
      id: json['id'],           // Assumes 'id' is an int in JSON
      key: json['key'],         // Assumes 'key' is a string in JSON
      region: json['region'],   // Assumes 'region' is a string in JSON
    );
  }

  // toJson: A method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'region': region,
    };
  }
}