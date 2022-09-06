import 'package:flutter/material.dart';

import 'ctm_header_widget.dart';
import 'ctm_textWith_key_value_rowline_widget.dart';


class CtmReviewCardWidget extends StatelessWidget {
  const CtmReviewCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(

        child: Row(
          children: [
            Expanded(flex: 1, child:

            Container(
              height: 150,
              child:
                //static  logo image
              HeaderWidget(150, true, Icons.person_add_alt_1_rounded),
            ),
            ),
            Expanded(flex: 3, child: Container(
              child: Column(
                children: [
                    /// Ctm design Set up
                  ///
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Name",ctmValue: "Review Name",),
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Date",ctmValue: "2/2/2022",),
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Rating",ctmValue: "5 *",),
                  SizedBox(height: 5,),
                  Divider(height: 1,thickness: 1,color: Theme.of(context).primaryColor,),
                  SizedBox(height: 5,),
                  CtmTextWithKeyValueRowLineWidget(ctmKey: "Comments",ctmValue: "Here",),

                ],
              ),

            )),
          ],
        ),
      ),
    );
  }
}
