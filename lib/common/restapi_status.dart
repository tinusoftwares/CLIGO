import 'dart:io';

import '../local_db_sqflite/db_helper.dart';
import '../local_db_sqflite/db_helper_local.dart';

class RestApiStatus {
  var token= DBHelper01.getToken('token');
  static Map<String, String> headerMap = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };

  static Map<String, String> headerMapWithToken = {
    "Accept": "application/json",
    "Authorization": 'Bearer '+DBHelper01.getToken('token').toString()
  };

  static int successStatusCode = 200;
  static int errorStatusCode = 401;
  static String errorStatusMessage = "";
}
