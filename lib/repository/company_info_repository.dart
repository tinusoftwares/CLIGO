
import '../../common/api_url.dart';
import '../../common/restapi_status.dart';
import 'package:http/http.dart' as http;

class CompanyInfoRepository {


  Future companyAboutUs() async {
    Uri url = Uri.parse(ApiURL.companyAboutUsGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print(' about us  code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future companyTermsAndCondition() async {
    Uri url = Uri.parse(ApiURL.companyTermsGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print(' Terms and condition code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future companyPrivacyPolicy() async {
    Uri url = Uri.parse(ApiURL.companyPrivacyTypeGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print(' about us  code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future companyFAQ() async {
    Uri url = Uri.parse(ApiURL.companyFAQGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print(' about us  code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future companyQuestion() async {
    Uri url = Uri.parse(ApiURL.companyQuestionGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print(' FAQ Question code:' + response.body.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
