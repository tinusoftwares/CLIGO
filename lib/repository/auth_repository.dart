import 'dart:convert';
import 'package:http/http.dart' as http;

import '../common/api_url.dart';
import '../common/restapi_status.dart';

class AuthRepository {

  Future loginRep(Map<String, String> loginMap) async {
    Uri url = Uri.parse(ApiURL.loginPostUrl);
    try {
      final response = await http.post(url,
          body: jsonEncode(loginMap), headers: RestApiStatus.headerMap);
      print('bodyResponseLogin :' + response.body.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future registerRep(Map<String, dynamic> registerMap) async {
    Uri url = Uri.parse(ApiURL.registerPostUrl);

    try {
      final response = await http.post(url,
          body: jsonEncode(registerMap), headers: RestApiStatus.headerMap);
      print('bodyResponseReg :' + response.body.toString());
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
      print('bodyResponseForget :' + response.body.toString());
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
      print('bodyResponseForget :' + response.body.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }
}
