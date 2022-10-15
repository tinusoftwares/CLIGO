import 'dart:async';
import '../../common/api_url.dart';
import '../../common/restapi_status.dart';

import 'package:http/http.dart' as http;

class SettingsRepository {

  Future initSettings() async {
    Uri url = Uri.parse(ApiURL.busDynamicAppSettingsGetUrl);

    try {
      final response = await http.get(url, headers: RestApiStatus.headerMap);
      print('bodyResponseSetting code :' + response.statusCode.toString());
      return response;

    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }
}

