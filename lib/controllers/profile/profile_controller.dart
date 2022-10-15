import 'dart:convert';
import '../../common/ctm_alert_widget.dart';
import '../../models/profile_info_model.dart';
import '../../repository/profile_repository.dart';
import 'package:get/get.dart';

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
      print('profile res  : ' + bodyMap.toString());

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              isLoadingData.value=true;
              profile.value = ProfileInfoModel.fromJson(bodyMap['data']);
              print('Login Mail  :'+profile.value.loginEmail.toString());
            }
          }
      } else {
          CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
        print(' else error ');
      }
    }).onError((error, stackTrace) {
      print('Error :' + error.toString());
      print('stackTrace :' + stackTrace.toString());
      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
    });

  }
}
