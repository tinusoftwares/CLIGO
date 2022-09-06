import 'dart:convert';

import 'package:get/get.dart';

import '../../common/ctm_alert_widget.dart';
import '../../repository/auth_repository.dart';

class ResetPasswordController extends GetConnect{

  forgetPassCTR(Map<String, String> loginMap) {
    AuthRepository().forgetRestRep(loginMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      var resCode = resValue.statusCode;
      print('forget pass status  : ' + bodyMap['status'].toString());

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