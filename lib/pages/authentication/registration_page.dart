import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/ctm_strings.dart';
import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../controllers/country_controller/CountryController.dart';
import '../../repository/auth_repository.dart';
import '../widgets/ctm_header_widget.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  CountryController countryController = Get.put(CountryController());

  TextEditingController loginEmailEController = TextEditingController();
  TextEditingController loginMobileEController = TextEditingController();
  TextEditingController passEController = TextEditingController();
  TextEditingController rePassEController = TextEditingController();
  TextEditingController firstNameEController = TextEditingController();
  TextEditingController lastNameEController = TextEditingController();
  TextEditingController idTypeEController = TextEditingController();
  TextEditingController idNumberEController = TextEditingController();

  String loginEmail = '';
  String loginMobile = '';
  String password = '';
  String rePassword = '';
  String firstName = '';
  String lastName = '';
  String idType = '1';
  String idNumber = '';
  String countryId = "1";

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
            height: 150,
            child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
          ),
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
          /*  GestureDetector(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade300,
                    size: 80.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.grey.shade700,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),*/

          SizedBox(
            height: 20,
          ),
          Text(
            CtmStrings.signUp,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 60,
          ),
          Text(
            CtmStrings.signUpBelowText,
            style: TextStyle(fontSize: 10),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              controller: firstNameEController,
              decoration: ThemeHelper()
                  .textInputDecoration(CtmStrings.regFirstName, CtmStrings.enterYFirstName),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              controller: lastNameEController,
              decoration: ThemeHelper()
                  .textInputDecoration(CtmStrings.regLastName, CtmStrings.enterYLastName),
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),
          SizedBox(height: 10.0),
          Container(
            child: TextFormField(
              controller: loginEmailEController,
              decoration: ThemeHelper()
                  .textInputDecoration(CtmStrings.regEmailAddressMust,CtmStrings.enterYMail),
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if ((val!.isEmpty) &&
                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                        .hasMatch(val)) {
                  return "Enter a valid email address";
                }
                return null;
              },
            ),
            decoration: ThemeHelper().inputBoxDecorationShaddow(),
          ),

          SizedBox(height: 10.0),

          /// Document drop down type
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                //  height: 50,
                  //width: 100,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1, color: Colors.black.withOpacity(0.2)),
                    color: Colors.white,
                  ),
                  child: _docTpe(),

                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 4,
                child: Container(
                  child: TextFormField(
                    controller: idNumberEController,
                    decoration: ThemeHelper()
                        .textInputDecoration(CtmStrings.regDocNo,CtmStrings.enterYDoc ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      return null;
                    },
                  ),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.0),

          SizedBox(height: 10.0),
          Container(
            child: TextFormField(
              controller: loginMobileEController,
              decoration: ThemeHelper().textInputDecoration(
                  CtmStrings.regMobileNumberMust, CtmStrings.enterYMobileNumber),
              keyboardType: TextInputType.phone,
              validator: (val) {
                if ((val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                  return CtmStrings.plzEnterValidPhone;
                }
                return null;
              },
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
                  .textInputDecoration( CtmStrings.regRePassMust,CtmStrings.enterYPassword ),
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
            height: 50,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 5),
                )
              ],
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(width: 1, color: Colors.black.withOpacity(0.2)),
              color: Colors.white,
            ),
            child: _countryListTo(),

          ),

          SizedBox(height: 10.0),
          FormField<bool>(
            builder: (state) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              checkboxValue = value!;
                              state.didChange(value);
                            });
                          }),
                      Text(
                        CtmStrings.regIAcceptTermsConditions,
                        style: TextStyle(color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          /// Click Page
                        },
                        child: Text(
                          " On Tap",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      state.errorText ?? '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              );
            },
            validator: (value) {
              if (!checkboxValue) {
                return 'You need to accept terms and conditions';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 5.0),

          /// Register Button
          _buildButtonReg(),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
            //child: Text('Don\'t have an account? Create'),
            child: Text.rich(TextSpan(children: [
              TextSpan(text: "Already have an Account? "), //
              TextSpan(
                text: ' Sign In',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ])),
          ),
        ],
      ),
    );
  }

  /// Location form country id

  _countryListTo() {
    return Obx(() {
      return DropdownButton(
        underline: SizedBox(),
        isDense: true,
        isExpanded: true,
        value: countryId,
        items: countryController.countryList.map((country) {
          return DropdownMenuItem(
            child: Text(
              country.name.toString(),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
            value: country.id,
          );
        }).toList(),
        onChanged: (countryToId) {
          countryId = countryToId.toString();
          setState(() {});
          print("You selected To: $countryToId");
        },
      );
    });
  }

  _docTpe() {
    return Obx(() {

      return DropdownButton(
        underline: SizedBox(),
        isDense: true,
        isExpanded: true,
        value: idType,
        items: countryController.docType.map((type) {
          return DropdownMenuItem(
            child: Text(
              type.name.toString(),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
            value: type.id,
          );
        }).toList(),
        onChanged: (idType) {
          idType = idType.toString();
          setState(() {});
          print("You selected type id : $idType");
        },
      );
    });
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
            style: ctmPaymentBtnTxtStyle,
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            firstName = firstNameEController.text;
            lastName = lastNameEController.text;
            loginEmail = loginEmailEController.text;
            loginMobile = loginMobileEController.text;
            idNumber = idNumberEController.text;
            password = passEController.text;
            rePassword = rePassEController.text;

            Map<String, dynamic> regBodyMap = {
              "login_email": loginEmail,
              "login_mobile": loginMobile,
              "password": password,
              "repassword": rePassword,
              "first_name": firstName,
              "last_name": lastName,
              "id_type": idType,
              "id_number": idNumber,
              "country_id": countryId,
            };

            print('regBodyMap' + regBodyMap.toString());
            AuthRepository().registerRep(regBodyMap).then((value) {



              var bodyMap = json.decode(value.body);
              print('Login bodyMap ' + bodyMap.toString());
              var resCode = value.statusCode;
              print('Login status  : ' + bodyMap['status'].toString());
            //  print('Setting res Code : ' + bodyMap['response'].toString());

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
            });
          }
        },
      ),
    );
  }
}
