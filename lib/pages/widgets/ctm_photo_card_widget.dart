import 'package:flutter/material.dart';

import 'ctm_header_widget.dart';

class CtmPhotoCardWidget extends StatelessWidget {
  const CtmPhotoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        child: Row(
          children: [
            Expanded(flex: 1, child: Container(
              height: 150,
              child: HeaderWidget(150, true, Icons.person_add_alt_1_rounded),
            ),
            ),
            SizedBox(width: 5,),
            Expanded(flex: 1, child: Container(
              height: 150,
              child: HeaderWidget(150, true, Icons.person_add_alt_1_rounded),
            )),
            SizedBox(width: 5,),
            Expanded(flex: 1, child: Container(
              height: 150,
              child: HeaderWidget(150, true, Icons.person_add_alt_1_rounded),
            )),


          ],
        ),
      ),
    );
  }
}
