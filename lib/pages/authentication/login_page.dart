import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../common/ctm_alert_widget.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_margin.dart';
import '../../common/ctm_padding.dart';
import '../../common/ctm_sizes.dart';
import '../../common/ctm_strings.dart';
import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../controllers/auth/login_controller.dart';
import '../../local_db_sqflite/db_helper_local.dart';
import '../../repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late  ProgressDialog pr;
  TextEditingController mailTextEditCTR = TextEditingController();
  TextEditingController phoneTextEditCTR = TextEditingController();
  TextEditingController passTextEditCTR = TextEditingController();
  String email = '';
  String mobile = '';
  String password = '';
  bool isMobile = true;
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    pr=ProgressDialog(context);
    pr.style(
        message: 'Loading ...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    return Scaffold(
      backgroundColor: CtmColors.appWhiteColor,
      body: _buildLoginBody(),
    );
  }

  /// Build Login Body
  Widget _buildLoginBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: CtmSizes.headerHeight,
              child: Image.asset(
                  CtmStrings.appLogoImagePNGPath,
              )),
          SafeArea(
            child: Container(
              padding: pageRootPadding,
              margin: pageRootMargin, // This will be the login form
              child: Column(
                children: [
                  Text(
                    CtmStrings.login,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 30.0),
                  _buildLoginForm()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Login Form UI
  Form _buildLoginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            /// mail or phone
            isMobile
                ? Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: mailTextEditCTR,
                      decoration: ThemeHelper().textInputDecoration(
                          CtmStrings.loginPhone, CtmStrings.enterYMobileNumber),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return CtmStrings.plzEnterValidPhone;
                        }
                        return null;
                      },
                    ),
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  )
                : Container(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: mailTextEditCTR,
                      decoration: ThemeHelper().textInputDecoration(
                          CtmStrings.loginMail, CtmStrings.enterYMail),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return CtmStrings.plzEnterValidMail;
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(val)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  ),

            SizedBox(height: 5.0),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  if (isMobile) {
                    isMobile = false;
                  } else {
                    isMobile = true;
                  }
                  setState(() {});
                },
                child: Text(
                  CtmStrings.switchPhoneORMail,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: passTextEditCTR,
                obscureText: true,
                decoration: ThemeHelper().textInputDecoration(
                    CtmStrings.loginPass, CtmStrings.enterYPassword),
                validator: (val) {
                  if (val!.isEmpty) {
                    return CtmStrings.plzEnterYPassword;
                  }
                  return null;
                },
              ),
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
            ),

            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/forget_password');
                },
                child: Text(
                  CtmStrings.loginForGetYPass,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(context),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text(
                    CtmStrings.signIn,
                    style: ctmPaymentBtnTxtStyle,
                  ),
                ),
                onPressed: () {
                  ///note : type 1. email 2.mobile

                  ///done login part
                  if (_formKey.currentState!.validate()) {
                    email = mailTextEditCTR.text;
                    mobile = phoneTextEditCTR.text;
                    password = passTextEditCTR.text;

                    Map<String, String> loginMap = {
                      "userid": email,
                      "password": password,
                      "type": isMobile ? "mobile" : "email",
                    };

                    print(loginMap);
                    pr.show();
                    AuthRepository().loginRep(loginMap).then((resValue) async {
                      var bodyMap = json.decode(resValue.body);

                      var resCode = resValue.statusCode;
                      print('bodyMap login bc'+bodyMap.toString());

                      if (resCode == 200 || resCode == 201 || resCode == 202) {
                        if (bodyMap['status'] == "success") {
                          if (bodyMap['response'] == 200) {
                            if (bodyMap['data'] != null) {
                              print(bodyMap['data']);
                              var token = bodyMap['data'];

                              DBHelper01.setStore('token',token);
                              DBHelper01.getToken('token');

                              CtmAlertDialog.successAlertDialog('Login', 'Successful!');
                              pr.hide();
                              Get.offAllNamed('/find_ticket');
                            }else{
                              pr.hide();
                              CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
                            }
                          }else{
                            pr.hide();
                            CtmAlertDialog.apiServerErrorAlertDialog('Server Error :','');
                          }
                        }else{
                          pr.hide();
                          CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',bodyMap['message']);
                        }
                      } else {
                        pr.hide();
                        CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',bodyMap['message']);
                      }
                    }).onError((error, stackTrace) {
                      print('Error :' + error.toString());
                      print('stackTrace :' + stackTrace.toString());
                      CtmAlertDialog.apiServerErrorAlertDialog('Server Error :',error.toString());
                      pr.hide();
                    });

                  }

                },
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
              //child: Text('Don\'t have an account? Create'),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: CtmStrings.loginHaveAccount),
                TextSpan(
                  text: CtmStrings.signUp,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(RegistrationPage());
                    },
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ])),
            ),
          ],
        ));
  }

}
