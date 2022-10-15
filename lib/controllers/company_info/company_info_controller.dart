import 'dart:convert';
import '../../common/ctm_alert_widget.dart';
import '../../models/company_info_model.dart';
import '../../repository/company_info_repository.dart';
import 'package:get/get.dart';

class CompanyInfoController extends GetConnect {

  Rx<CompanyInfoModel> companyAboutUs= CompanyInfoModel().obs;
  Rx<CompanyInfoModel> companyPolicy= CompanyInfoModel().obs;
  Rx<CompanyInfoModel> companyTerms= CompanyInfoModel().obs;
  Rx<CompanyInfoModel> companyFAQ= CompanyInfoModel().obs;
  Rx<CompanyInfoModel> companyFAQQuestion= CompanyInfoModel().obs;

  RxList<CompanyInfoModel> companyFAQQuestionList = List<CompanyInfoModel>.empty(growable: true).obs;

  RxBool isDataLoadingUs=false.obs;
  RxBool isDataLoadingPolicy=false.obs;
  RxBool isDataLoadingTerms=false.obs;
  RxBool isDataLoadingFAQ=false.obs;
  RxBool isDataLoadingQA=false.obs;


  @override
  void onInit() {
    super.onInit();
    print('CompanyInfoController.onInit');
    companyAboutUsCTR();
    companyPolicyCTR();
    companyTermsCTR();
    companyFAQCTR();
    companyQuestionsCTR();

  }

   companyAboutUsCTR(){
     CompanyInfoRepository().companyAboutUs().then((resValue) {
       var bodyMap = json.decode(resValue.body);
       print('country status  : ' + bodyMap['status'].toString());
         if (bodyMap['status'] == "success") {
           if (bodyMap['response'] == 200) {
             if (bodyMap['data'] != null) {
               companyAboutUs.value=CompanyInfoModel.fromJson(bodyMap['data']);
               isDataLoadingUs.value=true;
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

   companyPolicyCTR(){
     CompanyInfoRepository().companyPrivacyPolicy().then((resValue) {
       var bodyMap = json.decode(resValue.body);

       var resCode = resValue.statusCode;
       print('country status  : ' + bodyMap['status'].toString());

         if (bodyMap['status'] == "success") {
           if (bodyMap['response'] == 200) {
             if (bodyMap['data'] != null) {
               companyPolicy.value=CompanyInfoModel.fromJson(bodyMap['data']);
               isDataLoadingPolicy.value=true;
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

   companyTermsCTR(){
     CompanyInfoRepository().companyTermsAndCondition().then((resValue) {
       var bodyMap = json.decode(resValue.body);

       var resCode = resValue.statusCode;
       print('country status  : ' + bodyMap['status'].toString());

         if (bodyMap['status'] == "success") {
           if (bodyMap['response'] == 200) {
             if (bodyMap['data'] != null) {
               companyTerms.value=CompanyInfoModel.fromJson(bodyMap['data']);
               isDataLoadingTerms.value=true;
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

   companyFAQCTR(){
     CompanyInfoRepository().companyFAQ().then((resValue) {
       var bodyMap = json.decode(resValue.body);
       print('country status  : ' + bodyMap['status'].toString());

         if (bodyMap['status'] == "success") {
           if (bodyMap['response'] == 200) {
             if (bodyMap['data'] != null) {
               companyFAQ.value=CompanyInfoModel.fromJson(bodyMap['data']);
               isDataLoadingFAQ.value=true;
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

   companyQuestionsCTR(){
     CompanyInfoRepository().companyQuestion().then((resValue) {
       var bodyMap = json.decode(resValue.body);
       print('country status  : ' + bodyMap['status'].toString());
         if (bodyMap['status'] == "success") {
           if (bodyMap['response'] == 200) {
             if (bodyMap['data'] != null) {

               for(var history in bodyMap['data']){
                 companyFAQQuestionList.add(CompanyInfoModel.fromJson(history));
               }
               print('Booking Id:'+companyFAQQuestionList[0].title.toString());
               print('Booking Id:'+companyFAQQuestionList[0].subTitle.toString());
               print('lng Country :'+companyFAQQuestionList.length.toString());

            isDataLoadingQA.value=true;
             }
           }

       }
         else {
           CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
       }
     }).onError((error, stackTrace) {
       print('Error :' + error.toString());
       print('stackTrace :' + stackTrace.toString());
       CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
     });
   }



}
