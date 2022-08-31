import 'package:flutter/material.dart';
import 'package:flutter_bus/route_generator.dart';


import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'common/ctm_strings.dart';
import 'controllers/booking/dynamic_seat_plan_controller.dart';
import 'controllers/controller_bindings.dart';
import 'controllers/settings/setting_controller.dart';
import 'models/setting_model.dart';

void main()  async{
  SettingController settingController = Get.put(SettingController());
  DynamicSeatPlanController seatPlanController = Get.put(DynamicSeatPlanController());
  ControllerBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppMainPage());

}

class AppMainPage extends StatelessWidget {

  Color _primaryColor = HexColor('#04aa6b');// #DC54FE
  Color _accentColor = HexColor('#04aa6b'); // #8A02AE

  @override
  Widget build(BuildContext context) {
    print(' name :'+CtmStrings.appName);
    SettingController settingController = Get.put(SettingController());

    return GetBuilder<SettingController> (
        init: settingController,
        builder: (_) {
          SettingModel config= settingController.setting.value;
          print('Text:'+settingController.setting.value.logotext.toString());

          CtmStrings.appName =config.apptitle.toString();
          CtmStrings.language =config.language.toString();
          CtmStrings.headerLogo =config.headerlogo.toString();
          CtmStrings.favIcon =config.favicon.toString();
          CtmStrings.logoText =config.logotext.toString();
          CtmStrings.appTitle =config.apptitle.toString();
          CtmStrings.copyright =config.copyright.toString();
          CtmStrings.headerColor =config.headercolor.toString();
          CtmStrings.footerColor =config.footercolor.toString();
          CtmStrings.bottomFooterColor =config.bottomfootercolor.toString();
          CtmStrings.buttonColor =config.buttoncolor.toString();
          CtmStrings.buttonTextColor =config.buttontextcolor.toString();
          CtmStrings.fontFamily =config.fontfamely.toString();
          CtmStrings.taxType =config.taxType.toString();
          CtmStrings.maxTicket =config.maxTicket.toString();
          CtmStrings.country =config.country.toString();
          CtmStrings.currencyCountry =config.currencyCountry.toString();
          CtmStrings.timezone =config.timezone.toString();
          CtmStrings.currencyCode =config.currencyCode.toString();
          CtmStrings.currencySymbol =config.currencySymbol.toString();

          print('copyright :'+CtmStrings.copyright.toString());
          print('Logo Text :'+settingController.setting.value.logotext.toString());

          return GetMaterialApp(
            title: CtmStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: _primaryColor,
              accentColor: _accentColor,
              scaffoldBackgroundColor: Colors.grey.shade100,
              primarySwatch: Colors.grey,
            ),
            initialRoute: '/splash_screen',
           // initialRoute: '/success_ful',
            onGenerateRoute: RouteGenerator.generatorRoute,
          );
        }
    );
  }
  _webConfigSetUpStaticValue(SettingModel webConfigValue){
    print('LogoText :'+webConfigValue.logotext.toString());
    print('AppTitle :'+webConfigValue.apptitle.toString());
    print('ButtonColor :'+webConfigValue.buttoncolor.toString());
    print('ButtonColor :'+webConfigValue.copyright.toString());
    print('ButtonColor :'+webConfigValue.buttoncolor.toString());
    print('ButtonColor :'+webConfigValue.buttoncolor.toString());


    CtmStrings.appTitle=webConfigValue.apptitle.toString();
    CtmStrings.appTitle=webConfigValue.apptitle.toString();

    CtmStrings.copyright=webConfigValue.copyright.toString();
    CtmStrings.country=webConfigValue.country.toString();
    CtmStrings.currencyCode=webConfigValue.currencyCode.toString();
    CtmStrings.currencySymbol=webConfigValue.currencySymbol.toString();

    CtmStrings.logoText=webConfigValue.logotext.toString();
    CtmStrings.appTitle=webConfigValue.apptitle.toString();
    CtmStrings.appTitle=webConfigValue.apptitle.toString();
    CtmStrings.appTitle=webConfigValue.apptitle.toString();
    CtmStrings.appTitle=webConfigValue.apptitle.toString();

    print('static copyright :'+CtmStrings.copyright.toString());

  }

}

