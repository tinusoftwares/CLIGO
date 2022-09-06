import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ctm_colors.dart';
/*
  app alert dialog define here
 */

class CtmAlertDialog {

  static apiServerErrorAlertDialog(String title, String error,) {
    Get.snackbar(title, error.toString());
  }

  static fieldAlertDialog(String title, String error) {
    Get.snackbar(title, error.toString(),
        backgroundColor: CtmColors.appWhiteColor, colorText: CtmColors.appRedColor);
  }

  static successAlertDialog(String title, String error) {
    Get.snackbar(title, error.toString(),
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
