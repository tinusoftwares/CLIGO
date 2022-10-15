import 'package:flutter/material.dart';
import '../../common/ctm_colors.dart';
import 'package:get/get.dart';
/*
  app alert dialog define here
 */

class CtmAlertDialog {

  static apiServerErrorAlertDialog(String title, String error,) {
    Get.snackbar(title, error.toString(),
        backgroundColor: CtmColors.appWhiteColor, colorText: CtmColors.appRedColor
    );
  }

  static fieldAlertDialog(String title, String error) {
    Get.snackbar(title, error.toString(),
        backgroundColor: CtmColors.appWhiteColor, colorText: CtmColors.appRedColor);
  }

  static successAlertDialog(String title, String error) {
    Get.snackbar(title, error.toString(),
        backgroundColor: CtmColors.appWhiteColor, colorText: Colors.green);
  }
}
