import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/ctm_strings.dart';
import '../../models/setting_model.dart';
import '../../repository/settings_repository.dart';

class SettingController extends GetxController {
  Rx<SettingModel> setting = SettingModel().obs;
  @override
  void onInit() {
    super.onInit();
    print(' SettingController Call ');
    appSettingsCTR();
  }

  appSettingsCTR() {
    SettingsRepository().initSettings().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('settings', json.encode(bodyMap['data']));
              setting.value = SettingModel.fromJson(bodyMap['data']);

              print('Api app title :'+setting.value.logotext.toString());
             CtmStrings.appName =setting.value.logotext.toString();
              print('dynamic app Name :'+CtmStrings.appName);
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
    update();

  }
}
