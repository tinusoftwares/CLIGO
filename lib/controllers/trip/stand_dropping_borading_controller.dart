

import 'dart:convert';
import 'package:get/get.dart';

import '../../models/stand_boarding_dropping_model.dart';
import '../../repository/stand_dropping_boarding_repository.dart';

class StandDroppingBoardingController extends GetConnect {


  RxList<StandDroppingBoardModel> standBoardingList = List<StandDroppingBoardModel>.empty(growable: true).obs;
  RxBool isDataLoadingBoarding = false.obs;
  RxList<StandDroppingBoardModel> standDroppingList = List<StandDroppingBoardModel>.empty(growable: true).obs;
  RxBool isDataLoadingDropping = false.obs;


  ///stand Boarding
  standBoardingCTR(String byTripId) {

    StandDroppingBoardingRepository().standBoardingRepo(byTripId).then((resValue) async {
      standBoardingList.clear();
      isDataLoadingBoarding.value=false;
      var bodyMap = json.decode(resValue.body);
      // print('find tickets trip bodyMap ' + bodyMap.toString());
      var resCode = resValue.statusCode;
      print('boarding  status  : ' + bodyMap['status'].toString());
      print('boarding  res Code : ' + bodyMap['response'].toString());

      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);

              for(var boarding in bodyMap['data']){
                standBoardingList.add(StandDroppingBoardModel.fromJson(boarding));
              }
              print(' boarding stand Id  :'+standBoardingList[0].standId.toString());
              print('stand  :'+standBoardingList.length.toString());
              isDataLoadingBoarding.value=true;
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

  ///stand Dropping
  standDroppingCTR(String byTripId) {

    StandDroppingBoardingRepository().standDroppingRepo(byTripId).then((resValue) async {
      standDroppingList.clear();
      isDataLoadingDropping.value=false;
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('trip status  : ' + bodyMap['status'].toString());
      print('trip res Code : ' + bodyMap['response'].toString());

      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);

              for(var dropping in bodyMap['data']){
                standDroppingList.add(StandDroppingBoardModel.fromJson(dropping));
              }
              print(' dropping stand id :'+standDroppingList[0].tripId.toString());
              print('lng standDroppingList :'+standDroppingList.length.toString());
              isDataLoadingDropping.value=true;
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
