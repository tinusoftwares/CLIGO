import 'dart:convert';

import '../../common/api_url.dart';
import '../../common/ctm_alert_widget.dart';
import '../../common/restapi_status.dart';
import 'package:http/http.dart' as http;

class AuthRepository {

  Future loginRep(Map<String, String> loginMap) async {
    Uri url = Uri.parse(ApiURL.loginPostUrl);
    try {
      final response = await http.post(url, body: jsonEncode(loginMap), headers: RestApiStatus.headerMap);
      print('bodyResponseLogin code :' + response.statusCode.toString());

      return response;
    } on Exception catch (exception) {
      CtmAlertDialog.apiServerErrorAlertDialog('Alert', ' Server Error');
      throw (exception);
    } catch (error) {
      CtmAlertDialog.apiServerErrorAlertDialog('Alert', ' Server Error');
      throw Exception(error);
    }
  }

  Future registerRep(Map<String, dynamic> registerMap) async {
    Uri url = Uri.parse(ApiURL.registerPostUrl);

    try {
      final response = await http.post(url,
          body: jsonEncode(registerMap), headers: RestApiStatus.headerMap);
      print('bodyResponseReg  code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future forgetRep(Map<String, dynamic> forgetMap) async {
    Uri url = Uri.parse(ApiURL.forgetPassPostUrl);
    try {
      final response = await http.post(url,
          body: forgetMap, headers: RestApiStatus.headerMap);
      print('bodyResponseForget code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future forgetRestRep(Map<String, dynamic> forgetMap) async {
    Uri url = Uri.parse(ApiURL.forgetPassRestPostUrl);
    try {
      final response = await http.post(url,
          body: forgetMap, headers: RestApiStatus.headerMap);
      print('bodyResponseForget code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }
}
