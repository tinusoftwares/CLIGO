import 'dart:convert';
import '../../common/ctm_alert_widget.dart';
import '../../models/booking_history_model.dart';
import '../../repository/booking_repository.dart';
import 'package:get/get.dart';

class BookingHistoryController extends GetConnect {


  @override
  void onInit() {
    super.onInit();
    print(' Booking History');
    bookingHistoryCTR();

  }

  RxList<BookingHistoryModel> bookingHistoryList = List<BookingHistoryModel>.empty(growable: true).obs;
  RxBool isDataLoading = false.obs;

  bookingHistoryCTR() {
    BookingRepository().bookingTicketHistoryRep().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      print(' Booking history response  : ' + bodyMap.toString());

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);
              for(var history in bodyMap['data']){
                bookingHistoryList.add(BookingHistoryModel.fromJson(history));
              }
              print('Booking Id:'+bookingHistoryList[0].id.toString());
              print('lng Country :'+bookingHistoryList.length.toString());
              isDataLoading.value=true;
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
