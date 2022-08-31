
import 'package:flutter/material.dart';

import '../../common/theme_helper.dart';

class CtmTextFormFieldWidget extends StatefulWidget {
  const CtmTextFormFieldWidget({Key? key}) : super(key: key);

  @override
  State<CtmTextFormFieldWidget> createState() => _CtmTextFormFieldWidgetState();
}

class _CtmTextFormFieldWidgetState extends State<CtmTextFormFieldWidget> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: TextFormField(
        decoration: ThemeHelper().textInputDecoration("Mobile Number", "Enter your mobile number"),
        keyboardType: TextInputType.phone,
        validator: (val) {
          if ((val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
            return "Enter a valid phone number";
          }
          return null;
        },
      ),
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
    );
  }
}
