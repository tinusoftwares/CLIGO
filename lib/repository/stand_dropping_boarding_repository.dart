import '../../common/api_url.dart';
import '../../common/restapi_status.dart';
import 'package:http/http.dart' as http;

class StandDroppingBoardingRepository {

  Future standDroppingRepo(String tripId) async {
    Uri url = Uri.parse(ApiURL.droppingStandByTripIdGetUrl+tripId);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
     print('standDropping res code :'+response.body.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future standBoardingRepo(String tripId) async {
    Uri url = Uri.parse(ApiURL.boardingStandByTripIdGetUrl+tripId);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print('standBoarding res code:'+response.statusCode.toString());
      return  response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
