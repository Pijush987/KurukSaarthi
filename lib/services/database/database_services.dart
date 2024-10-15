import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuruk_saarthi/model/voter_list_model/dart/voter_list_model.dart';
import 'package:kuruk_saarthi/utils/const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'kuruk_saarthi.db');

    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future<void> insertMultipleOrders(List<VoterModel> voters) async {
    final db = await DatabaseHelper().database;
    Batch batch = await db.batch();

    // Add all insert operations to the batch
    for (var voter in voters) {
      batch.insert(
        'voters',
        voter.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    // Commit the batch (this executes all the insert operations at once)
    await batch.commit(noResult: true);
  }

  Future<void> insertNotification(String message, String date) async {
    final db = await database;
    await db.insert('notification', {
      'message': message,
      'date': date,
    });
  }

  Future<List<Map<String, dynamic>>> getNotifications() async {
    final db = await database;
    return await db.query('notification', orderBy: 'date DESC');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE voters (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        key TEXT,
        name TEXT,
        age INTEGER,
        gender TEXT,
        address TEXT,
        voterIDNumber TEXT,
        boothNumber TEXT,
        boothAddress TEXT,
        region TEXT,
        subDivision TEXT,
        district TEXT,
        pinCode TEXT,
        assembly TEXT,
        assemblyNumber TEXT,
        state TEXT,
        isActive INTEGER,
        createdAt TEXT
      )
    ''');

    await db.execute('''
    CREATE TABLE notification (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      message TEXT,
      date TEXT
    )
  ''');
  }

    Future<void> saveApiData(VoterListModel apiData) async {
      List<VoterModel> voters = [];
      for (var item in apiData.docs) {
        VoterModel voter = VoterModel(
          name: item.name,
          age: item.age,
          gender: item.gender,
          address: item.address,
          voterIDNumber: item.voterIDNumber,
          boothNumber: item.boothNumber,
          boothAddress: item.boothAddress,
          region: item.region,
          subDivision: item.subDivision,
          district: item.district,
          pinCode: item.pinCode,
          assembly: item.assembly,
          assemblyNumber: item.assemblyNumber,
          state: item.state,
        );
        voters.add(voter);
      }
      // Insert all orders in a batch
      await insertMultipleOrders(voters);
    }

  Future<List<VoterModel>> getVoters({required int offset, required int limit}) async {
    final db = await database;
    final List<Map<String, dynamic>> reqMap = await db.rawQuery(
      'SELECT * FROM voters LIMIT $limit OFFSET $offset',
    );
    log(reqMap.toString());
    return List.generate(reqMap.length, (i) {
      return VoterModel.fromJson(reqMap[i]);
    });
  }

  Future<int> getTotalCount() async {
    final db = await database;
    var result = await db.rawQuery('SELECT COUNT(*) FROM voters');
    int count = Sqflite.firstIntValue(result) ?? 0; // Extract the count value
    return count;
  }

  Future<List<VoterModel>> searchVoters(String query) async {
    final db = await database;
    // final List<Map<String, dynamic>> maps = await db.rawQuery(
    //   "SELECT * FROM voters WHERE name LIKE '%$query%' OR voterIDNumber LIKE '%$query%'",
    // );

    List<Map<String, dynamic>> results = await db.rawQuery(
        "SELECT * FROM voters WHERE name LIKE ? OR voterIDNumber LIKE ?",
        ['%$query%', '%$query%'] // Pass the search query as parameter
    );

    return List.generate(results.length, (i) {
      return VoterModel.fromJson(results[i]);
    });
  }

  Future<List<VoterModel>> filterVoters(int minAge, int maxAge, String voterId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM voters WHERE age >= $minAge AND age <= $maxAge AND voterIDNumber = '$voterId'",
    );
    return List.generate(maps.length, (i) {
      return VoterModel.fromJson(maps[i]);
    });
  }

  Future<List<String>> getAllArea() async {
    var dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient.rawQuery("SELECT DISTINCT subDivision FROM voters");
    List<String> regions = result.map((row) => row["subDivision"] as String).toList();
    return regions;
  }

  Future<List<String>> getAllRegions(String subDivision) async {
    debugPrint("$subDivision   ##########");
    var dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient.rawQuery(
        "SELECT DISTINCT region FROM voters WHERE subDivision = ?",
        [subDivision]
    );
    debugPrint("$result   ##########");
    List<String> regions = result.map((row) => row["region"] as String).toList();
    return regions;
  }

  Future<List<String>> getUniqueBoothNumbersByRegion(String region) async {
    var dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient.rawQuery(
        "SELECT DISTINCT boothNumber FROM voters WHERE region = ?",
        [region]
    );
    List<String> boothNumbers = result.map((row) => row["boothNumber"] as String).toList();
    return boothNumbers;
  }

  Future<String?> getSubDivisionByRegionAndBoothNumber(String region, String boothNumber) async {
    var dbClient = await database;
    List<Map<String, dynamic>> result = await dbClient.rawQuery(
        "SELECT subDivision FROM voters WHERE region = ? AND boothNumber = ?",
        [region, boothNumber]
    );

    if (result.isNotEmpty) {
      return result[0]["subDivision"] as String;  // Return the first matching subDivision
    } else {
      return null;  // Return null if no match is found
    }
  }

  Future<void> deleteAllNotifications() async {
    final db = await database;
    await db.delete('notification');
  }

}
