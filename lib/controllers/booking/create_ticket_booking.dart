import 'dart:convert';
import 'package:get/get.dart';

import '../../repository/booking_repository.dart';

class CreateTicketBookingController extends GetConnect {

  ///paid
  ticketBookingCTR(Map<String, String> bookingInfoMap) {

   Map<String, dynamic> bookingInfoMapTest={

    'login_email': 't@t.com',
    'login_mobile':'12344444444',
    'first_name': 'test',
    'last_name': 'api',
    'id_type':'passport',
    'country_id':'12',
    'id_number':'12345sdsd',
    'address':'sdfsdf sdf sdf sdf',
     'city': '',
     'zip_code':'1229',
    'trip_id' :'1',
    'subtripId':'1',
    'pick_location_id':'1',
    'drop_location_id':'2',
    'pickstand':'20',
    'dropstand':'23',
    'totalprice':'1000',
    'discount':'50',
    'tax':'38',
    'grandtotal':'900',
    'aseat':'1',
    'cseat':'0',
    'spseat':'0',
    'journeydate' :'29-11-2021',
    'pay_method':'1',
    'payment_status':'paid',
    'paydetail' :'this is test',
    'vehicle_id' :'1',
    'seatnumbers' :'D1',
    'totalseat' :'1',
    'partialpay' :'300'

    };

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
    });
  }
  ///unpaid
  ticketBookingUnpaidCTR(Map<String, String> bookingInfoUnpaidMap) {
    Map<String, dynamic> bookingInfoUnpaidMapTest={

    'login_email': 't@t.com',
    'login_mobile':'12344444444',
    'first_name':'test',
    'last_name':'api',
    'id_type':'passport',
    'country_id':'12',
    'id_number':'12345sdsd',
    'address': 'sdfsdf sdf sdf sdf',
    'city':'rp',
    'zip_code':'1229',
    'trip_id':'10',
    'subtripId':'18',
    'pick_location_id':'1',
    'drop_location_id':'2',
    'pickstand':'38',
    'dropstand':'39',
    'totalprice':'1000',
    'discount':'50',
    'tax':'38',
    'grandtotal':'900',
    'aseat':'1',
    'cseat':'0',
    'spseat':0,
    'journeydate':'29-11-2021',
    'payment_status':'unpaid',
    'paydetail':'this is test',
    'vehicle_id':'1',
    'seatnumbers':'B1',
    'totalseat':'1'
    };

    BookingRepository().creteTicketBookingUnpaidRep(bookingInfoUnpaidMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      print('booking Unpaid bodyMap ' + bodyMap.toString());
      var resCode = resValue.statusCode;
      print('booking Unpaid status  : ' + bodyMap['status'].toString());
      print('booking Unpaid res Code : ' + bodyMap['response'].toString());

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
    });
  }
}
