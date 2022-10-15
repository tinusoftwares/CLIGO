import 'dart:convert';


import '../../common/ctm_alert_widget.dart';
import '../../repository/settings_repository.dart';
import 'package:get/get.dart';

import '../../models/setting_model.dart';
import '../../common/ctm_strings.dart';

class SettingController extends GetConnect {
 final setting = SettingModel().obs;
 final isLoading=true.obs;

  @override
  void onInit()async {
    super.onInit();
    print(' SettingController Call ');
   await appSettingsCTR();

  }

 Future<void> appSettingsCTR()async {
    isLoading(true);
    SettingsRepository().initSettings().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              isLoading(false);
              print(bodyMap['data']);
              setting.value = SettingModel.fromJson(bodyMap['data']);
              CtmStrings.appName =setting.value.logotext.toString();
              print('dynamic app Name :'+CtmStrings.appName);

              /// Color
              CtmStrings.appName =setting.value.logotext.toString();
              print('dynamic app Name :'+CtmStrings.appName);

            }

        }
      } else {
          CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
        print(' else error ');
      }
    }).onError((error, stackTrace) {
      print('Error :' + error.toString());
      print('stackTrace :' + stackTrace.toString());
      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
    });

  }

}
