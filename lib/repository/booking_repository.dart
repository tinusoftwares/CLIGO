import 'dart:convert';

import 'package:http/http.dart' as http;

import '../common/api_url.dart';
import '../common/restapi_status.dart';

class BookingRepository {

  /// pay now
  Future creteTicketBookingRep(Map<String, dynamic> creteTBMap) async {

    Uri url = Uri.parse(ApiURL.ticketBookingPostUrl);
    try {
      final response = await http.post(url,
          body: jsonEncode(creteTBMap), headers: RestApiStatus.headerMapWithToken);
      print('bodyResponseCTB code :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  /// Pay later
  Future creteTicketBookingUnpaidRep(Map<String, dynamic> creTBUMap) async {

    Uri url = Uri.parse(ApiURL.ticketBookingUnpaidPostUrl);
    try {
      final response = await http.post(url,
          body: creTBUMap, headers: RestApiStatus.headerMapWithToken);
      print('bodyResponseCTBU code:' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future bookingFindTicketsTripRep(Map<String, dynamic> forgetMap) async {

    Uri url = Uri.parse(ApiURL.bookingFindTicketsTripListPostUrl);
    try {
      final response = await http.post(url, body: forgetMap);
      print('bodyResponseBFTTR code :' + response.statusCode.toString());
      return response;

    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future bookingTicketHistoryRep() async {
    Uri url = Uri.parse(ApiURL.bookingTicketsHistoryGetUrl);
    try {
      final response = await http.get(url,headers: RestApiStatus.headerMapWithToken);
      print('booking History code  :' + response.statusCode.toString());
      return response;
    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
