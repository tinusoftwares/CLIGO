import 'dart:convert';
import 'package:get/get.dart';
import '../../common/ctm_alert_widget.dart';
import '../../local_db_sqflite/db_helper.dart';
import '../../repository/auth_repository.dart';

class LoginController extends GetConnect {

  loginCTR(Map<String, String> loginMap) {
    AuthRepository().loginRep(loginMap).then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      var resCode = resValue.statusCode;
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);
              var token = bodyMap['data'];

              await DBHelper.object.setToken(token);
              print('token :'+DBHelper.object.getToken().toString());
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
