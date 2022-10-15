import 'dart:convert';
import '../../common/ctm_alert_widget.dart';
import '../../repository/booking_repository.dart';
import 'package:get/get.dart';

class CreateTicketBookingController extends GetConnect {

  ///paid payment must
  ticketBookingCTR(Map<String, String> bookingInfoMap) {
    BookingRepository().creteTicketBookingRep(bookingInfoMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      print('create ticket Booking response  : ' + bodyMap.toString());
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
               print(bodyMap['data']);
            }
          }
        }else{
          CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
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

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);

            }
          }
      } else {
          CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
      }
    }).onError((error, stackTrace) {
      print('Error :' + error.toString());
      print('stackTrace :' + stackTrace.toString());
      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
    });
  }
}
