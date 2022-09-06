
import 'package:http/http.dart' as http;

import '../common/api_url.dart';
import '../common/restapi_status.dart';

class CountryRepository {

  Future countryNameRep() async {
    Uri url = Uri.parse(ApiURL.countryListGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print('bodyResponseCountryName code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future countryWiseAreaLocationRep() async {
    Uri url = Uri.parse(ApiURL.countryWiseAreaLocationGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
        print('bodyResponseCountryArea code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }
}
