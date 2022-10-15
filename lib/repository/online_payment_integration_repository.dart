import '../../common/api_url.dart';
import '../../common/restapi_status.dart';
import 'package:http/http.dart' as http;

class OnlinePaymentIntegrationRepo {

  Future onlinePaymentOptions() async {
    Uri url = Uri.parse(ApiURL.onlinePaymentOptionsGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
      print('bodyResponse options code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future onlinePaymentPaypal() async {
    Uri url = Uri.parse(ApiURL.onlinePaymentPaypalGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
        print('bodyResponse Paypal code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future onlinePaymentPayStack() async {
    Uri url = Uri.parse(ApiURL.onlinePaymentPayStackGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
        print('bodyResponse pay stack code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future onlinePaymentStripe() async {
    Uri url = Uri.parse(ApiURL.onlinePaymentPayStripeGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
        print('bodyResponse stripe code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future onlinePaymentRazorpay() async {
    Uri url = Uri.parse(ApiURL.onlinePaymentRazorGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMap);
        print('bodyResponse Razor pay code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
