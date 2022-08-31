
import 'package:flutter_bus/controllers/settings/setting_controller.dart';
import 'package:flutter_bus/controllers/trip/find_ticket_trip_controller.dart';
import 'package:get/get.dart';

import 'auth/forget_password_controller.dart';
import 'auth/login_controller.dart';
import 'auth/register_controller.dart';
import 'auth/reset_password_controller.dart';
import 'booking/create_ticket_booking.dart';
import 'country_controller/CountryController.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {

    /// Auth controller bindings
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(), fenix: true);

    ///  booking controller bindings
    Get.lazyPut<CreateTicketBookingController>(() => CreateTicketBookingController(), fenix: true);

    /// settings controller bindings
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);

    /// Trip controller bindings
    Get.lazyPut<FindTicketTripController>(() => FindTicketTripController(),fenix: true);

    /// country controller bindings
    Get.lazyPut<CountryController>(() => CountryController(),fenix: true);

    /// Booking history controller bindings


  }
}
