import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_info/company_info_controller.dart';
import '../../models/company_info_model.dart';

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  CompanyInfoController companyInfoController =
      Get.put(CompanyInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Terms and condition'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (companyInfoController.isDataLoadingTerms.value) {
            CompanyInfoModel companyInfo =
                companyInfoController.companyTerms.value;
            return _buildCompanyInfoCard(companyInfo);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  _buildCompanyInfoCard(CompanyInfoModel companyInfo) {
    return Card(
      elevation: 0.2,
      child: Column(
        children: [
          Text(
            'Title :${companyInfo.title}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Date  :${companyInfo.createdAt}'),
          Text('Description :${companyInfo.description}'),
        ],
      ),
    );
  }
}
