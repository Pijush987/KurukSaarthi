// // Model class for Region
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'RegionModule.dart';
//
// // Database Helper
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static Database? _database;
//
//   DatabaseHelper._privateConstructor();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'voter.db');
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE regions (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             assembly TEXT,
//             region TEXT
//           )
//         ''');
//       },
//     );
//   }
//
//   // // Insert multiple records in batch
//   // Future<void> insertRegions(List<Map<String, dynamic>> regionList) async {
//   //   debugPrint("total list !!!!!${regionList.length}");
//   //   final db = await database;
//   //   Batch batch = db.batch();
//   //   for (var region in regionList) {
//   //     batch.insert('regions', region);
//   //   }
//   //   await batch.commit();
//   // }
//
//   Future<void> insertObject(DatabaseClass obj) async {
//     log("db data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>>>>>>>>>");
//     final db = await database;
//     await db.insert(
//       'regions',
//       obj.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//   Future<void> insertMultipleObjects(List<DatabaseClass> objects) async {
//     final db = await database;
//     final batch = db.batch();
//
//     for (var obj in objects) {
//       batch.insert(
//         'regions',
//         obj.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//
//     await batch.commit(noResult: true);
//   }
//
//   Future<int> countObjects() async {
//     final db = await database;
//     final count = Sqflite.firstIntValue(
//         await db.rawQuery('SELECT COUNT(*) FROM regions')
//     );
//     return count ?? 0;
//   }
//
//   Future<void> checkObjectCount() async {
//     int count = await DatabaseHelper.instance.countObjects();
//     print('Total objects in database: $count');
//
//   }
//   Future<List<DatabaseClass>> searchObjectsWithRawQuery(String searchTerm) async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.rawQuery(
//         'SELECT * FROM regions WHERE assembly LIKE ?', ['%$searchTerm%']
//     );
//
//     return List.generate(maps.length, (i) {
//       return DatabaseClass.fromMap(maps[i]);
//     });
//   }
//
//   Future<void> deleteAllObjectsRaw() async {
//     final db = await database;
//
//     // Execute raw SQL query to delete all rows
//     await db.rawDelete('DELETE FROM regions');
//   }
//   // Fetch all records from the regions table
//   // Future<List<DatabaseClass>> getAllRegions(int limit, int offset) async {
//   //   debugPrint("fetch list !!!!!");
//   //   final db = await database;
//   //   final List<Map<String, dynamic>> maps = await db.query(
//   //     'regions',
//   //     limit: limit,
//   //     offset: offset,
//   //   );
//   //
//   //   return List.generate(maps.length, (i) {
//   //     return DatabaseClass.fromMap(maps[i]);
//   //   });
//   // }
//
//
//   Future<void> processLargeJsonFile() async {
//     final db = await database;
//     Directory directory = await getApplicationDocumentsDirectory();
//     File jsonFile = File('${directory.path}/users.json');
//     final stream = jsonFile.openRead();
//
//
//     // UTF-8 decoding the stream and buffering
//     StringBuffer buffer = StringBuffer();
//     List<dynamic> jsonBuffer = [];
//     int batchSize = 10;
//     log("chunk111   ## $stream");
//     // Listening to the stream
//     await for (var chunk in stream.transform(utf8.decoder)) {
//       log("chunk   ##$chunk");
//       buffer.write(chunk);
//
//       String data = buffer.toString();
//
//       // Check if we have complete JSON data (array or object)
//       try {
//         if (isCompleteJson(data)) {
//           // Parse JSON objects (assuming your file contains an array of JSON objects)
//           List<dynamic> jsonObjects = jsonDecode(data);
//           jsonBuffer.addAll(jsonObjects);
//
//           if (jsonBuffer.length >= batchSize) {
//             await insertJsonBatch(db, jsonBuffer.sublist(0, batchSize));
//             jsonBuffer = jsonBuffer.sublist(batchSize);
//           }
//           buffer.clear();  // Clear the buffer after successful parsing
//         }
//       } catch (e) {
//         // Continue to accumulate data until valid JSON is formed
//         continue;
//       }
//     }
//
//     // Insert remaining objects
//     if (jsonBuffer.isNotEmpty) {
//       await insertJsonBatch(db, jsonBuffer);
//     }
//     print('JSON processing completed.');
//   }
//
//   bool isCompleteJson(String data) {
//     // Basic check for complete JSON data
//     data = data.trim();
//     if (data.startsWith('[') && data.endsWith(']')) {
//       return true;  // JSON array is complete
//     } else if (data.startsWith('{') && data.endsWith('}')) {
//       return true;  // JSON object is complete
//     }
//     return false;
//   }
//
//   Future<void> insertJsonBatch(Database db, List<dynamic> jsonObjects) async {
//     Batch batch = db.batch();
//     log("db data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>>>>>>>>>");
//
//     for (var jsonObject in jsonObjects) {
//       log("db data %%%%%>>>>>>>>>>>>>>>${jsonObject}  ${jsonObject.runtimeType}");
//       // batch.insert('regions', jsonObject);
//     }
//     await batch.commit(noResult: true);
//   }
//
//   Future<int> getTotalRecordCount() async {
//     log("db data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%>>>>>>>>>>>>>>>");
//
//     final db = await database;
//     // Execute a SQL query to count the rows in the table
//     var result = await db.rawQuery('SELECT COUNT(*) FROM regions');
//     int count = Sqflite.firstIntValue(result) ?? 0;
//     return count;
//   }
//
//   Future<List<Map<String, dynamic>>> getDataBatch( int limit, int offset) async {
//     final db = await database;
//     // Query data with limit and offset for pagination
//     List<Map<String, dynamic>> data = await db.query(
//       'regions',
//       limit: limit,
//       offset: offset,
//     );
//     return data;
//   }
//
//   // Future<void> processLargeJsonFile() async {
//   //   // final file = File(filePath);
//   //   final db = await database;
//   //   Directory directory = await getApplicationDocumentsDirectory();
//   //   File jsonFile = File('${directory.path}/pijush.json');
//   //   final stream = jsonFile.openRead();
//   //
//   //   // UTF-8 decoding the stream
//   //   final lines = stream.transform(utf8.decoder).transform(LineSplitter());
//   //
//   //   // Variables to store data temporarily
//   //   List<dynamic> buffer = [];
//   //   int batchSize = 100;
//   //
//   //   // Reading each line (assuming each line is a JSON object or part of it)
//   //   await for (String line in lines) {
//   //     print("#############$line");
//   //     try {
//   //       // Decode each JSON object
//   //       final jsonObject = jsonDecode(line);
//   //       buffer.add(jsonObject);
//   //
//   //       // If buffer reaches 100 objects, write to the database
//   //       if (buffer.length >= batchSize) {
//   //         await insertJsonBatch(db, buffer);
//   //         buffer.clear();  // Clear the buffer after batch insert
//   //       }
//   //     } catch (e) {
//   //       print("Error processing line: $e");
//   //     }
//   //   }
//   //
//   //   // Insert remaining data in buffer
//   //   if (buffer.isNotEmpty) {
//   //     await insertJsonBatch(db, buffer);
//   //   }
//   //
//   //   print('JSON processing completed.');
//   // }
//
//   // Future<void> insertJsonBatch(Database db, List<dynamic> jsonObjects) async {
//   //   Batch batch = db.batch();
//   //   for (var jsonObject in jsonObjects) {
//   //     batch.insert('json_data', {'json_content': jsonEncode(jsonObject)});
//   //   }
//   //   await batch.commit(noResult: true);
//   // }
//
//   // Future<Database> initDatabase() async {
//   //   final directory = await getApplicationDocumentsDirectory();
//   //   final path = join(directory.path, 'large_json.db');
//   //
//   //   return openDatabase(
//   //     path,
//   //     version: 1,
//   //     onCreate: (db, version) async {
//   //       await db.execute('''
//   //       CREATE TABLE json_data (
//   //         id INTEGER PRIMARY KEY AUTOINCREMENT,
//   //         json_content TEXT
//   //       )
//   //     ''');
//   //     },
//   //   );
//   // }
//
//
//   Future<List<DatabaseClass>> getAllRegions(int limit, int offset) async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('regions',limit: 26, offset: 0,);
//
//     return List.generate(maps.length, (i) {
//       return DatabaseClass.fromMap(maps[i]);
//     });
//   }
//
//   Future<List<DatabaseClass>> getObjects(int limit, int offset) async {
//     List<DatabaseClass> objects = await DatabaseHelper.instance.getAllRegions(0,0);
//     for (var obj in objects) {
//       print('assembly: ${obj.assembly}, Name: ${obj.region}');
//     }
//     return objects;
//   }
// }