import 'dart:convert';

import 'package:get/get.dart';

import '../../repository/auth_repository.dart';

class ResetPasswordController extends GetxController{

  forgetPassCTR(Map<String, String> loginMap) {
    AuthRepository().forgetRestRep(loginMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      var resCode = resValue.statusCode;
      print('rest Pass status  : ' + bodyMap['status'].toString());


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