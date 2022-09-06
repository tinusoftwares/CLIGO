
import 'package:http/http.dart' as http;

import '../common/api_url.dart';
import '../common/restapi_status.dart';

class ProfileRepository {

  Future userProfileInfoRep() async {
    Uri url = Uri.parse(ApiURL.userProfileInfoGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMapWithToken);
      print('profile res code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future userProfileUpdateRep(Map<String, String> profileUpdateMap) async {
    Uri url = Uri.parse(ApiURL.userProfileUpdateUrl);
    try {
      final response = await http.post(url,
          body: profileUpdateMap, headers: RestApiStatus.headerMap);
      print('bodyResponseProfile code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future userChangePasswordRep(Map<String, String> changePassMap) async {
    Uri url = Uri.parse(ApiURL.userChangePassPostUrl);
    try {
      final response = await http.post(url,
          body: changePassMap, headers: RestApiStatus.headerMap);
      print('bodyResponseForget code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
