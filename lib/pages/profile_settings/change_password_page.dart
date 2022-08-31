
import 'package:flutter/material.dart';


import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import '../../common/theme_helper.dart';
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
      backgroundColor: Colors.white,
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
            'Change Password',
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
                  .textInputDecoration('Old Password ', 'Enter your old password'),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),

          SizedBox(height: 10.0),
          Container(
            child: TextFormField(
              controller: passEController,
              obscureText: true,
              decoration: ThemeHelper()
                  .textInputDecoration("Password*", "Enter your password"),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter your password";
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
                  .textInputDecoration("Re-Password*", "Enter your password"),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter your password";
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
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            "Register".toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
         /*   AuthRepository().registerRep(regBodyMap).then((value) {

              //--------------

              var bodyMap = json.decode(value.body);
              print('Login bodyMap ' + bodyMap.toString());
              var resCode = value.statusCode;
              print('Setting status  : ' + bodyMap['status'].toString());
              print('Setting res Code : ' + bodyMap['response'].toString());

              if (resCode == 200 || resCode == 201 || resCode == 202) {
                if (bodyMap['status'] == "success") {
                  if (bodyMap['response'] == 200) {
                    if (bodyMap['data'] != null) {
                      print(bodyMap['data']);
                      var regData = bodyMap['data'];
                      print('Register Success :' + regData.toString());
                      Get.offAllNamed('/login');
                    }
                  }
                }
              } else {
                print(' else error ');
              }
            });*/
          }
        },
      ),
    );
  }
}