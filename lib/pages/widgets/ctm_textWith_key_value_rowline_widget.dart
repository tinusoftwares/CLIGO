
import 'package:flutter/material.dart';

class CtmTextWithKeyValueRowLineWidget extends StatelessWidget {

  String? ctmKey;
  String ?ctmValue;


  CtmTextWithKeyValueRowLineWidget({ required this.ctmKey, required this.ctmValue});

  @override
  Widget build(BuildContext context) {

      return Padding(
        padding: const EdgeInsets.only(left: 10,top: 3,bottom: 3),
        child: Row(

          children: [
            Expanded(
              flex: 1,
              child: Text(ctmKey!,
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),

            Expanded(
              flex: 2,
              child: Text(
                ' :  '+ ctmValue!,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      );

  }
}
