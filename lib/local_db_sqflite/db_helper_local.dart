


import 'package:get_storage/get_storage.dart';

class DBHelper01 {

  static GetStorage db = GetStorage(DbStrings.dbName);

  init() async {
    await GetStorage.init(DbStrings.dbName);
  }

  static String? getToken(String key) {
     db = GetStorage(DbStrings.dbName);
    return  db.read(key);
  }

  static void setStore(String key,dynamic value) {
    db = GetStorage(DbStrings.dbName);
    db.write(key,value);

  }

  Future<void> setToken(String token) async {
    db = GetStorage(DbStrings.dbName);
    await db.write(DbStrings.userToken, token);
    await db.save();
  }


  Future<void> logout() async {
    db = GetStorage(DbStrings.dbName);
    await db.remove(DbStrings.dbName);
    await db.remove(DbStrings.userName);
    await db.remove(DbStrings.name);
  }
}

class DbStrings {
  static const dbName = 'local_save';
  static const userToken = 'user_token';
  static const userName = 'user_name';
  static const name = 'name';
}


