
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../controllers/company_info/company_info_controller.dart';
import '../../models/company_info_model.dart';
import 'package:get/get.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  CompanyInfoController companyInfoController=Get.put(CompanyInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Policy '),),
      body: Obx(() {
        if (companyInfoController.isDataLoadingPolicy.value) {
          CompanyInfoModel companyInfo = companyInfoController.companyPolicy.value;
          return _buildCompanyInfoCard(companyInfo);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  _buildCompanyInfoCard(CompanyInfoModel companyInfo){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(companyInfo.title.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(companyInfo.createdAt.toString(),style: TextStyle(fontStyle: FontStyle.italic),),
            Padding(
              padding: const EdgeInsets.only(left: 0,top: 10,right: 10),
              child: Html(data: companyInfo.description.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
