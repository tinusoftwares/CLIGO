import 'dart:convert';
import 'package:get/get.dart';

import '../../models/country_model.dart';
import '../../models/country_wise_area_model.dart';
import '../../models/doc_type_model.dart';
import '../../repository/country_repository.dart';

class CountryController extends GetConnect{


   ///country init 01
  RxList<CountryModel> countryList = List<CountryModel>.empty(growable: true).obs;
  RxList<DocTypeModel> docType = List<DocTypeModel>.empty(growable: true).obs;

  /// country wise area location
  RxList<CountryWiseAreaModel> countryWiseAreaLocationList = List<CountryWiseAreaModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    print(' country list Call ');
    countryCTR();
    countryWiseAreaLocationCTR();
    regDocTypeList();

  }


  countryCTR() {
    CountryRepository().countryNameRep().then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      var resCode = resValue.statusCode;
      print('country status  : ' + bodyMap['status'].toString());
      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {

              for(var cty in bodyMap['data']){
                  countryList.add(CountryModel.fromJson(cty));
              }
              print(' Country name :'+countryList[0].name.toString());
              print('lng Country :'+countryList.length.toString());

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
  }


  countryWiseAreaLocationCTR() {
    CountryRepository().countryWiseAreaLocationRep().then((resValue) async {
      var bodyMap = json.decode(resValue.body);

      var resCode = resValue.statusCode;
      print('area status  : ' + bodyMap['status'].toString());

      if (resCode == 200 || resCode == 201 || resCode == 202) {
        if (bodyMap['status'] == "success") {
          if (bodyMap['response'] == 200) {
            if (bodyMap['data'] != null) {

              for(var cty in bodyMap['data']){
                countryWiseAreaLocationList.add(CountryWiseAreaModel.fromJson(cty));
              }
              print('area :'+countryWiseAreaLocationList[0].name.toString());
              print('lng are :'+countryWiseAreaLocationList.length.toString());

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
  }

  regDocTypeList(){
    docType.add(DocTypeModel(id: "1",name: "passport"));
    docType.add(DocTypeModel(id: "2",name: "nid"));
  }

}

