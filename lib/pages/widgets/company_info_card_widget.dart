
import 'package:flutter/material.dart';

import '../../models/company_info_model.dart';

class CompanyInfoCardWidget extends StatelessWidget {

  CompanyInfoModel companyInfoModel;

  CompanyInfoCardWidget(this.companyInfoModel);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Company Card Info : '+companyInfoModel.toString()),);
  }
}
