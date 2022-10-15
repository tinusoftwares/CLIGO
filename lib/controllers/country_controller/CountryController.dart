import 'dart:convert';

import '../../common/ctm_alert_widget.dart';
import '../../models/country_model.dart';
import '../../models/country_wise_area_model.dart';
import '../../repository/country_repository.dart';
import 'package:get/get.dart';

import '../../models/doc_type_model.dart';

class CountryController extends GetConnect {
  ///country init 01
  RxList<CountryModel> countryList = List<CountryModel>.empty(growable: true).obs;

  RxList<DocTypeModel> docType = List<DocTypeModel>.empty(growable: true).obs;

  /// country wise area location
  RxList<CountryWiseAreaModel> countryWiseAreaLocationList = List<CountryWiseAreaModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    print('CountryController.onInit');
    countryCTR();
    countryWiseAreaLocationCTR();
    regDocTypeList();
  }

  countryCTR() {
    CountryRepository().countryNameRep().then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      print('country  status   : ' + bodyMap['status']);
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              for (var cty in bodyMap['data']) {
                countryList.add(CountryModel.fromJson(cty));
              }
              print(' Country name :' + countryList[0].name.toString());
              print('lng Country :' + countryList.length.toString());
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

  countryWiseAreaLocationCTR() {
    CountryRepository().countryWiseAreaLocationRep().then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      var resCode = resValue.statusCode;
      print('area status  : ' + bodyMap['status'].toString());


        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {
              for (var cty in bodyMap['data']) {
                countryWiseAreaLocationList
                    .add(CountryWiseAreaModel.fromJson(cty));
              }
              print('area :' + countryWiseAreaLocationList[0].name.toString());
              print(
                  'lng are :' + countryWiseAreaLocationList.length.toString());
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

  regDocTypeList() {
    docType.add(DocTypeModel(id: "1", name: "passport"));
    docType.add(DocTypeModel(id: "2", name: "nid"));
  }
}
