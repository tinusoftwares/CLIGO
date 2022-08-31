import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/ctm_strings.dart';
import '../../models/profile_info_model.dart';
import '../../repository/profile_repository.dart';

class ProfileController extends GetConnect {
  Rx<ProfileInfoModel> profile = ProfileInfoModel().obs;
  RxBool isLoadingData=false.obs;

  @override
  void onInit() {
    super.onInit();
    print('ProfileController.onInit');
    profileInfoCTR();
  }

  profileInfoCTR() {
     isLoadingData.value=false;
    ProfileRepository().userProfileInfoRep().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('profile status  : ' + bodyMap['status'].toString());
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);

              isLoadingData.value=true;

              profile.value = ProfileInfoModel.fromJson(bodyMap['data']);
              print('Login Mail  :'+profile.value.loginEmail.toString());

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
