

import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class DBHelper {
  static DBHelper object = DBHelper._();

  /// not clear this line
  DBHelper._();

  init() async {
    await GetStorage.init(DbStrings.db_name);
  }

  String? getToken() {
    GetStorage db = GetStorage(DbStrings.db_name);
    String? token = db.read(
      DbStrings.user_token,
    );
    return token;
  }

  Future<void> setToken(String token) async {
    GetStorage db = GetStorage(DbStrings.db_name);
    await db.write(DbStrings.user_token, token);
    await db.save();
  }

 /* Future<void> setUserData(UserModel user) async {
    String userString = jsonEncode(user);
    GetStorage db = GetStorage(DbStrings.db_name);
    await db.write(DbStrings.user_data, userString);
    await db.save();
  }

  UserModel? getUserData() {
    GetStorage db = GetStorage(DbStrings.db_name);
    String userString = db.read(DbStrings.user_data);
    return UserModel.fromJson(jsonDecode(userString));
  }*/

  /// play store update

  String? playstoreVersionCodeGet() {
    GetStorage db = GetStorage(DbStrings.db_name);
    String? playStoreVersionCode = db.read('playStoreCode');
    return playStoreVersionCode;
  }

  String? localVersionCodeGet() {
    GetStorage db = GetStorage(DbStrings.db_name);
    String? localVersionCode = db.read('localStoreCode');
    return localVersionCode;
  }

  /// version code set up
  Future<void> playStoreVersionCodeSet(
      String playStoreCode, String newVersion) async {
    GetStorage db = GetStorage(DbStrings.db_name);
    await db.write('localStoreCode', newVersion);
    await db.write('playStoreCode', playStoreCode);
    await db.save();
  }

  Future<void> logout() async {
    GetStorage db = GetStorage(DbStrings.db_name);
    await db.remove(DbStrings.user_token);
    await db.remove(DbStrings.user_data);
    await db.remove(DbStrings.db_name);
  }
}

class DbStrings {
  static const db_name = 'local_save';
  static const user_token = 'user_token';
  static const user_data = 'user_data';
}


