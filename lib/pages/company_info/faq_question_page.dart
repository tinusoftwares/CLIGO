import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_info/company_info_controller.dart';
import '../../models/company_info_model.dart';

class FAQQuestionPage extends StatefulWidget {
  const FAQQuestionPage({Key? key}) : super(key: key);

  @override
  State<FAQQuestionPage> createState() => _FAQQuestionPageState();
}

class _FAQQuestionPageState extends State<FAQQuestionPage> {
  CompanyInfoController companyInfoController =
      Get.put(CompanyInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('FAQ Question'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (companyInfoController.isDataLoadingQA.value) {
            CompanyInfoModel companyInfo =
                companyInfoController.companyFAQ.value;
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
          Text('Crate :${companyInfo.createdAt}'),
          Text('Description :${companyInfo.description}'),
        ],
      ),
    );
  }
}
