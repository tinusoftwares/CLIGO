import 'dart:convert';
import 'package:get/get.dart';

import '../../common/ctm_alert_widget.dart';
import '../../repository/booking_repository.dart';

class CreateTicketBookingController extends GetConnect {

  ///paid payment must
  ticketBookingCTR(Map<String, String> bookingInfoMap) {
    BookingRepository().creteTicketBookingRep(bookingInfoMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('create ticket Booking status  : ' + bodyMap['status'].toString());

      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
               print(bodyMap['data']);
            }
          }
        }
      } else {
        print(' else error ');
      }
    }).onError((error, stackTrace) {
      print('Error :' + error.toString());
      print('stackTrace :' + stackTrace.toString());
      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
    });
  }

  ///unpaid Later payment
  ticketBookingUnpaidCTR(Map<String, String> bookingInfoUnpaidMap) {

    BookingRepository().creteTicketBookingUnpaidRep(bookingInfoUnpaidMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('booking Unpaid status  : ' + bodyMap['status'].toString());
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);

            }
          }
        }
      } else {
        print(' else error ');
      }
    }).onError((error, stackTrace) {
      print('Error :' + error.toString());
      print('stackTrace :' + stackTrace.toString());
      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
    });
  }
}
