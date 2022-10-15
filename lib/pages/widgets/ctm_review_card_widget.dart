import 'package:flutter/material.dart';
import '../../pages/widgets/ctm_header_widget.dart';
import '../../pages/widgets/ctm_textWith_key_value_rowline_widget.dart';

class CtmReviewCardWidget extends StatelessWidget {
  const CtmReviewCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(

        child: Row(
          children: [

            Expanded(flex: 3, child: Container(
              child: Column(
                children: [

                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Name",ctmValue: "tomas",),
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Date",ctmValue: "02-09-2022",),
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Rating",ctmValue: "4.5",),
                  SizedBox(height: 5,),
                  Divider(height: 1,thickness: 1,color: Theme.of(context).primaryColor,),
                  SizedBox(height: 5,),
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Comments",ctmValue: "nice bus",),

                ],
              ),

            )),
          ],
        ),
      ),
    );
  }
}
