import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../common/ctm_colors.dart';
import '../../controllers/booking/dynamic_seat_plan_controller.dart';
import '../../controllers/settings/setting_controller.dart';
import '../../models/setting_model.dart';

import '../../route_generator.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'common/ctm_strings.dart';
import 'controllers/controller_bindings.dart';
import 'controllers/settings/setting_binding.dart';

void main() async {
  SettingController settingController = Get.put(SettingController());
  DynamicSeatPlanController seatPlanController = Get.put(
      DynamicSeatPlanController());
  ControllerBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51KOFikFc0lmoA84nCaAiNKJ2bpbxLkirsH7mzjy4SxPPDAVDpz5kL4Vdu4UvXuEalx4UyhF0kx5Go4YSjHSaiBQK00UFpxKNWl';


  runApp(AppMainPage(settingCon: settingController,));
}

class AppMainPage extends StatelessWidget {
  const AppMainPage({Key? key, required this.settingCon}) :super(key: key);
  final SettingController settingCon;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      SettingModel settingModel=settingCon.setting.value;
      _webConfigSetUpStaticValue(settingModel);

      return GetMaterialApp(
        title: settingCon.isLoading.value?  CtmStrings.appName :settingModel.apptitle.toString() ,
        debugShowCheckedModeBanner: false,
        initialBinding: SettingBinding(),
        theme: settingCon.isLoading.value ?
        ThemeData(
            platform: TargetPlatform.android,
            useMaterial3: true,
            primaryColor: CtmColors.primaryColor,
            scaffoldBackgroundColor: CtmColors.appScaffoldBgColor,
        ) : ThemeData(
          fontFamily: settingCon.setting.value.fontfamely.toString(),
            useMaterial3: true,
            scaffoldBackgroundColor: CtmColors.appScaffoldBgColor,
            primaryColor: HexColor(settingCon.setting.value.bottomfootercolor.toString())
        ),
        initialRoute: '/splash_screen',
        onGenerateRoute: RouteGenerator.generatorRoute,
        themeMode: ThemeMode.dark,

      );
    });
  }

  /// next version come setting web config
  _webConfigSetUpStaticValue(SettingModel webConfigValue) {

    print('LogoText :' + webConfigValue.logotext.toString());
    print('AppTitle :' + webConfigValue.apptitle.toString());
    print('ButtonColor :' + webConfigValue.buttoncolor.toString());
    print('copyright :' + webConfigValue.copyright.toString());
    print('buttoncolor :' + webConfigValue.buttoncolor.toString());
    print('max Ticket :' + webConfigValue.maxTicket.toString());


    CtmStrings.maxTicket = webConfigValue.maxTicket.toString();
    CtmStrings.appTitle = webConfigValue.apptitle.toString();
    CtmStrings.copyright = webConfigValue.copyright.toString();
    CtmStrings.country = webConfigValue.country.toString();
    CtmStrings.currencyCode = webConfigValue.currencyCode.toString();
    CtmStrings.currencySymbol = webConfigValue.currencySymbol.toString();
    CtmStrings.logoText = webConfigValue.logotext.toString();


    print('static copyright :' + CtmStrings.copyright.toString());
  }

}

