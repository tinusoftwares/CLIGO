
import 'package:flutter/material.dart';
import 'package:flutter_bus/pages/authentication/login_page.dart';
import 'package:flutter_bus/pages/authentication/registration_page.dart';
import 'package:flutter_bus/pages/booking_process/booking_history_page.dart';
import 'package:flutter_bus/pages/booking_process/seat_plan_page.dart';
import 'package:flutter_bus/pages/company_info/about_page.dart';
import 'package:flutter_bus/pages/company_info/policy_page.dart';
import 'package:flutter_bus/pages/company_info/terms_condition_page.dart';
import 'package:flutter_bus/pages/profile_settings/change_password_page.dart';
import 'package:flutter_bus/pages/splash_screen.dart';
import 'package:flutter_bus/pages/success_page/success_page.dart';

import 'pages/authentication/forgot_password_page.dart';
import 'pages/booking_process/find_tickets_page.dart';
import 'pages/profile_settings/profile_page.dart';
import 'pages/review_section/reviews.dart';

class RouteGenerator{
  static Route <List<dynamic >> generatorRoute(RouteSettings? routeSettings){
    final arg= routeSettings!.arguments;

    switch(routeSettings.name){

      case  '/splash_screen' :{
        return MaterialPageRoute(builder: (_) => SplashScreen());
      }
      case  '/login' :{
        return MaterialPageRoute(builder: (_) => LoginPage());
      }
      case  '/register' :{
        return MaterialPageRoute(builder: (_) =>  RegistrationPage());
      }
      case  '/forget_password' :{
        return MaterialPageRoute(builder: (_) =>  ForgotPasswordPage());
      }

      /// 01
      case  '/find_ticket' :{
        return MaterialPageRoute(builder: (_) =>  FindTicketPage());
      }

      /// 02
     /* case  '/booking_now' :{
        return MaterialPageRoute(builder: (_) =>  BookingNowPage());
      }*/

     /// 03 pick and drop with seat plan
     /* case  '/pick_and_drop' :{
        return MaterialPageRoute(builder: (_) =>  PickupAndDropPage());
      }*/

     /// 04 don't need todo list
      case  '/seat_plan' :{
        return MaterialPageRoute(builder: (_) =>  SeatPlanPage());
      }

      /// 05 payment system
  /*    case  '/payment_system' :{
        return MaterialPageRoute(builder: (_) =>  PaymentSystemPage());
      }*/

      case  '/booking_history' :{
        return MaterialPageRoute(builder: (_) =>  BookingHistoryPage());
      }

   /*   case  '/booking_history_details' :{
        return MaterialPageRoute(builder: (_) =>  BookingHistoryDetailsPage());
      }*/



   /*   case  '/payment_system' :{
        return MaterialPageRoute(builder: (_) =>  PaymentSystemPage());
      }*/


      case  '/profile' :{
        return MaterialPageRoute(builder: (_) =>  ProfilePage());
      }

      case  '/change_password' :{
        return MaterialPageRoute(builder: (_) =>  ChangePasswordPage());
      }

      case  '/review' :{
        return MaterialPageRoute(builder: (_) =>  Reviews());
      }

      case  '/policy' :{
        return MaterialPageRoute(builder: (_) =>  PolicyPage());
      }

      case  '/terms_and_condition' :{
        return MaterialPageRoute(builder: (_) =>  TermsAndConditionPage());
      }

      case  '/about_us' :{
        return MaterialPageRoute(builder: (_) =>  AboutUs());
      }


      case  '/dynamic_seat_plan' :{
        return MaterialPageRoute(builder: (_) =>  SeatPlanPage());
      }


      case  '/success_ful' :{
        return MaterialPageRoute(builder: (_) =>  SuccessFulPage());
      }


      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }

}
