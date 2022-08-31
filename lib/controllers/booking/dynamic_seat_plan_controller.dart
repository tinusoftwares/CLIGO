import 'dart:convert';

import 'package:get/get.dart';

import '../../models/seat_plan_model.dart';
import '../../repository/seat_plan_repoitory.dart';


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
      var resCode = resValue.statusCode;
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['seatlayout'] != null) {

              seats.value=bodyMap['seatlayout'];
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
