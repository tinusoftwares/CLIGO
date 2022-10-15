import 'dart:convert';
import 'package:get/get.dart';

import '../../common/ctm_alert_widget.dart';
import '../../models/online_payment_model.dart';
import '../../models/online_payment_options_model.dart';
import '../../repository/online_payment_integration_repository.dart';

class OnlinePaymentController extends GetConnect {
  Rx<OnlinePaymentModel> onlinePaymentModel = OnlinePaymentModel().obs;
  RxList<OnlinePaymentOptionsModel> onlinePaymentOptions =
      List<OnlinePaymentOptionsModel>.empty(growable: true).obs;

  RxBool isLoadingDataOnlinePayment = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('OnlinePaymentController.onInit');
    onlinePaymentOptionsCTR();
    onlinePaymentPaypalCTR();
    onlinePaymentPayStackCTR();
    onlinePaymentStripeCTR();
    onlinePaymentRazorPayCTR();
  }

  onlinePaymentOptionsCTR() {
    OnlinePaymentIntegrationRepo()
        .onlinePaymentOptions()
        .then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('online options status  : ' + bodyMap['status'].toString());

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print(bodyMap['data']);
              onlinePaymentModel.value =
                  OnlinePaymentModel.fromJson(bodyMap['data']);
              for (var options in bodyMap['data']) {
                onlinePaymentOptions
                    .add(OnlinePaymentOptionsModel.fromJson(options));
              }
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

  onlinePaymentPaypalCTR() {
    OnlinePaymentIntegrationRepo().onlinePaymentPaypal().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('country status  : ' + bodyMap['status'].toString());

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {

              onlinePaymentModel.value = OnlinePaymentModel.fromJson(bodyMap['data']);
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

  onlinePaymentPayStackCTR() {
    OnlinePaymentIntegrationRepo().onlinePaymentPayStack().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('pay stack status  : ' + bodyMap['status'].toString());


        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {

              onlinePaymentModel.value =
                  OnlinePaymentModel.fromJson(bodyMap['data']);
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

  onlinePaymentStripeCTR() {
    OnlinePaymentIntegrationRepo().onlinePaymentStripe().then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      var resCode = resValue.statusCode;
      print('Stripe status  : ' + bodyMap['status'].toString());

        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              print('Pay strip API Response data ******************');
              print(bodyMap['data']);
              onlinePaymentModel.value =
                  OnlinePaymentModel.fromJson(bodyMap['data']);
            }

        }
      } else {
          CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
      }
    }).onError((error, stackTrace) {
      print('Error :' + error.toString());
      print('stackTrace :' + stackTrace.toString());
      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
    });
  }

  onlinePaymentRazorPayCTR() {
    OnlinePaymentIntegrationRepo()
        .onlinePaymentRazorpay()
        .then((resValue) async {
      var bodyMap = json.decode(resValue.body);
      print('Razor pay bodyMap ' + bodyMap.toString());
      print('Razor pay response  : ' + bodyMap.toString());
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              onlinePaymentModel.value =
                  OnlinePaymentModel.fromJson(bodyMap['data']);
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
