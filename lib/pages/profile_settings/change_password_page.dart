
import 'package:flutter/material.dart';


import 'dart:convert';

import 'package:flutter/gestures.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_strings.dart';

import '../../common/theme_helper.dart';
import '../../pages/authentication/login_page.dart';
import '../../pages/widgets/ctm_header_widget.dart';
import '../../repository/auth_repository.dart';
import 'package:get/get.dart';
import '../../controllers/country_controller/CountryController.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordPageState();
  }
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  CountryController countryController = Get.put(CountryController());

  TextEditingController oldPassEController = TextEditingController();
  TextEditingController passEController = TextEditingController();
  TextEditingController rePassEController = TextEditingController();



  String oldPassword = '';
  String password = '';
  String rePassword = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CtmColors.appWhiteColor,
      body: _buildRegBody(),
    );
  }

  Widget _buildRegBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.center,
            child: _buildRegForm(),
          ),
        ],
      ),
    );
  }

  _buildRegForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [


          SizedBox(
            height: 20,
          ),
          Text(
            CtmStrings.changePassMust,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 60,
          ),


          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              controller: oldPassEController,
              decoration: ThemeHelper()
                  .textInputDecoration(CtmStrings.oldPassMust, CtmStrings.enterYOldPassword),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),

          SizedBox(height: 10.0),
          Container(
            child: TextFormField(
              controller: passEController,
              obscureText: true,
              decoration: ThemeHelper()
                  .textInputDecoration(CtmStrings.regPassMust, CtmStrings.enterYPassword),
              validator: (val) {
                if (val!.isEmpty) {
                  return CtmStrings.plzEnterYPassword;
                }
                return null;
              },
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),
          SizedBox(height: 10.0),
          Container(
            child: TextFormField(
              obscureText: true,
              controller: rePassEController,
              decoration: ThemeHelper()
                  .textInputDecoration(CtmStrings.regRePassMust, CtmStrings.enterYPassword),
              validator: (val) {
                if (val!.isEmpty) {
                  return CtmStrings.plzEnterYPassword;
                }
                return null;
              },
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),
          SizedBox(height: 10.0),


          /// Register Button
          _buildButtonReg(),
          SizedBox(height: 10.0),

        ],
      ),
    );
  }



  /// Button Register
  _buildButtonReg() {
    return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            "Register".toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CtmColors.appWhiteColor,
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();


            oldPassword = oldPassEController.text;
            password = passEController.text;
            rePassword = rePassEController.text;

            Map<String, dynamic> regBodyMap = {

              "password": password,
              "repassword": rePassword,
              "oldpassword": oldPassword,

            };
            print('change pass' + regBodyMap.toString());
          }
        },
      ),
    );
  }
}