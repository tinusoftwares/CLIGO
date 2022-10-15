import 'package:flutter/material.dart';
import '../../pages/widgets/ctm_header_widget.dart';
import '../../pages/widgets/ctm_textWith_key_value_rowline_widget.dart';

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
              child: Image.network('https://cms.eichertrucksandbuses.com/uploads/truck/sub-category/a933e5958e4a354cfb8d22665bd244fd.png'),
            ),
            ),
            SizedBox(width: 5,),

            Expanded(flex: 1, child: Container(
              height: 150,
              child: Image.network('https://banner2.cleanpng.com/20180704/qrf/kisspng-airport-bus-ab-volvo-coach-volvo-buses-nambour-party-hire-5b3d800cc87963.9689141415307571328212.jpg'),
            )),
            SizedBox(width: 5,),
            Expanded(flex: 1, child: Container(
              height: 150,
              child: Image.network('https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/1860x1050-Volvo-7900-S-Charge-front45?size=1280,720&scl=1'),
            )),


          ],
        ),
      ),
    );
  }
}
