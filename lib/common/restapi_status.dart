import 'dart:io';

import '../local_db_sqflite/db_helper.dart';

class RestApiStatus {
  var token= DBHelper.object.getToken();
  static Map<String, String> headerMap = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };

  static Map<String, String> headerMapWithToken = {
    "Accept": "application/json",
    "Authorization": 'Bearer '+DBHelper.object.getToken().toString()
  };

  static int successStatusCode = 200;
  static int errorStatusCode = 401;
  static String errorStatusMessage = "";
}
