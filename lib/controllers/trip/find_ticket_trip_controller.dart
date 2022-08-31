import 'dart:convert';
import 'package:get/get.dart';

import '../../models/find_tickets_trip_list_model.dart';
import '../../repository/booking_repository.dart';
//01740303508 Sakib vai

class FindTicketTripController extends GetConnect {

  ///find Tickets  init 01
  RxList<FindTicketListModel> findTicketsList = List<FindTicketListModel>.empty(growable: true).obs;
  RxBool isDataLoading = false.obs;

   findTicketsTripCTR(Map<String, dynamic> findTicketMapBody) {

    BookingRepository().bookingFindTicketsTripRep(findTicketMapBody).then((resValue) async {
      findTicketsList.clear();
      isDataLoading.value=false;
      var bodyMap = json.decode(resValue.body);
     // print('find tickets trip bodyMap ' + bodyMap.toString());
      var resCode = resValue.statusCode;
      print('trip status  : ' + bodyMap['status'].toString());
      //print('trip res Code : ' + bodyMap['response'].toString());

      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);

              for(var fTList in bodyMap['data']){
                findTicketsList.add(FindTicketListModel.fromJson(fTList));
              }
              print(' find tickets  name :'+findTicketsList[0].tripId.toString());
              print('lng tickets :'+findTicketsList.length.toString());

              isDataLoading.value=true;
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
