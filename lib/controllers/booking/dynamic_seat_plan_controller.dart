import 'dart:convert';
import '../../common/ctm_alert_widget.dart';
import '../../models/seat_plan_model.dart';
import '../../repository/seat_plan_repoitory.dart';
import 'package:get/get.dart';


class DynamicSeatPlanController extends GetConnect {
  RxList<SeatPlanModel> seatList = List<SeatPlanModel>.empty(growable: true).obs;
  RxList<List<SeatPlanModel>> seatMultiList = List<List<SeatPlanModel>>.empty(growable: true).obs;
  var seats=[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  dynamicSeatPan(String tripId,String jData) {
    SeatPlanRepository().seatPlanDynamicRepo(tripId,jData).then((resValue) async {
      var bodyMap = json.decode(resValue.body);

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['seatlayout'] != null) {
              seats.value=bodyMap['seatlayout'];
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
