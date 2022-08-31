
import 'package:http/http.dart' as http;

import '../common/api_url.dart';
import '../common/restapi_status.dart';

class ReviewRepository {

  Future creteReviewRep(Map<String, String> reviewMap) async {
    Uri url = Uri.parse(ApiURL.createReviewPostUrl);
    try {
      final response = await http.post(url,
          body: reviewMap, headers: RestApiStatus.headerMap);
      print('bodyResponseCreateReview code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future getReviewRep(Map<String, String> registerMap) async {
    Uri url = Uri.parse(ApiURL.reviewGetUrlById);
    try {
      final response = await http.post(url,
          body: registerMap, headers: RestApiStatus.headerMap);
      print('bodyResponseGetReview code :' + response.statusCode.toString());
      return  response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
