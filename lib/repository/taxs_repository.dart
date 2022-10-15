import '../../common/api_url.dart';
import '../../common/restapi_status.dart';
import 'package:http/http.dart' as http;

class TaxRepository {

  Future taxRep() async {
    Uri url = Uri.parse(ApiURL.busDynamicAppTaxGetUrl);
    try {
      final response = await http.get(url, headers: RestApiStatus.headerMap);
      print('bodyResponseTax code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }


}
