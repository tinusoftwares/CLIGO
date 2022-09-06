

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_margin.dart';
import '../../common/ctm_padding.dart';
import '../../common/ctm_sizes.dart';
import '../../common/ctm_strings.dart';
import '../../common/theme_helper.dart';
import 'forgot_password_verification_page.dart';
import 'login_page.dart';
import '../widgets/ctm_header_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CtmColors.appBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: CtmSizes.headerHeight,
                child: HeaderWidget(CtmSizes.headerHeight, true, Icons.paste),
              ),
              SafeArea(
                child: Container(
                  margin: pageRootMargin,
                  padding: pageRootPadding,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(CtmStrings.forgetPassword,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(CtmStrings.emailAccountSubTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(CtmStrings.forgetPassDetailsText,
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      _buildForgetForm()
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  _buildForgetForm(){
    return   Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            child: TextFormField(
              decoration: ThemeHelper().textInputDecoration(CtmStrings.regEmailAddressMust, CtmStrings.enterYMail),
              validator: (val){
                if(val!.isEmpty){
                  return CtmStrings.plzEnterEmptyMail;
                }
                else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                  return CtmStrings.plzEnterValidMail;
                }
                return null;
              },
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),
          SizedBox(height: 40.0),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(CtmStrings.send.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CtmColors.appWhiteColor,
                  ),
                ),
              ),
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                 /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordVerificationPage()),
                  );*/
                }
              },
            ),
          ),
          SizedBox(height: 30.0),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: CtmStrings.isRememberPassword),
                TextSpan(
                  text: CtmStrings.login,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                      ,color: Theme.of(context).primaryColor
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
