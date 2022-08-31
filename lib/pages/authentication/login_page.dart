import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/ctm_strings.dart';
import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../controllers/auth/login_controller.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildLoginBody(),
    );
  }

  /// Build Login Body
  Widget _buildLoginBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: _headerHeight,
            child: Image.network(
              'https://bdtask-demo.com/backend/public/image/websetting/1655978324_10b0faacf09c0386ba34.png',
              color: Theme.of(context).primaryColor,
            ),
            // child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
          ),
          SafeArea(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10), // This will be the login form
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
                )),
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
                    return CtmStrings.plzEnterValidPhone;
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
                style: ThemeHelper().buttonStyle(),
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

                    loginController.loginCTR(loginMap);

                    print('mail : ' + mailTextEditCTR.text);
                    print('number : ' + phoneTextEditCTR.text);
                    print('pass : ' + passTextEditCTR.text);
                  }

                  Get.offAllNamed('/find_ticket');
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
