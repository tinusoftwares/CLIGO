
import 'package:flutter/material.dart';
import 'package:flutter_bus/pages/authentication/login_page.dart';
import 'package:flutter_bus/pages/authentication/registration_page.dart';
import 'package:flutter_bus/pages/booking_process/booking_history_page.dart';
import 'package:flutter_bus/pages/booking_process/seat_plan_page.dart';
import 'package:flutter_bus/pages/company_info/about_page.dart';
import 'package:flutter_bus/pages/company_info/policy_page.dart';
import 'package:flutter_bus/pages/company_info/terms_condition_page.dart';
import 'package:flutter_bus/pages/payment_method/paymnet_stripe.dart';
import 'package:flutter_bus/pages/profile_settings/change_password_page.dart';
import 'package:flutter_bus/pages/splash_screen.dart';
import 'package:flutter_bus/pages/success_page/success_page.dart';


import 'pages/authentication/forgot_password_page.dart';
import 'pages/booking_process/find_tickets_page.dart';
import 'pages/company_info/faq_page.dart';
import 'pages/company_info/faq_question_page.dart';
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


      case  '/seat_plan' :{
        return MaterialPageRoute(builder: (_) =>  SeatPlanPage());
      }

      case  '/booking_history' :{
        return MaterialPageRoute(builder: (_) =>  BookingHistoryPage());
      }



      case  '/profile' :{
        return MaterialPageRoute(builder: (_) =>  ProfilePage());
      }

      case  '/change_password' :{
        return MaterialPageRoute(builder: (_) =>  ChangePasswordPage());
      }

      case  '/review' :{
        return MaterialPageRoute(builder: (_) =>  Reviews());
      }

      case  '/about_us' :{
        return MaterialPageRoute(builder: (_) =>  AboutUs());
      }

      case  '/policy' :{
        return MaterialPageRoute(builder: (_) =>  PolicyPage());
      }

      case  '/terms_and_condition' :{
        return MaterialPageRoute(builder: (_) =>  TermsAndConditionPage());
      }

      case  '/company_faq' :{
        return MaterialPageRoute(builder: (_) =>  FAQPage());
      }

      case  '/company_question' :{
        return MaterialPageRoute(builder: (_) =>  FAQQuestionPage());
      }

      case  '/dynamic_seat_plan' :{
        return MaterialPageRoute(builder: (_) =>  SeatPlanPage());
      }


      case  '/success_ful' :{
        return MaterialPageRoute(builder: (_) =>  SuccessFulPage());
      }

      case  '/StripePayment' :{
        return MaterialPageRoute(builder: (_) =>  StripePayment());
      }

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }

}
