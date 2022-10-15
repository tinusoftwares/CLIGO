
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CtmBackButtonWidget extends StatelessWidget {
  const CtmBackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        print('Back');
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        color: Colors.red,
        width: 80,
        child: Center(
          child: Row(
            children: [
              Icon(Icons.arrow_back,color: Colors.white,),
              Text('Back',style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
