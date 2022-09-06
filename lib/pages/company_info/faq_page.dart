import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_info/company_info_controller.dart';
import '../../models/company_info_model.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  CompanyInfoController companyInfoController =
      Get.put(CompanyInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('FAQ'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (companyInfoController.isDataLoadingFAQ.value) {
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
      child: Expanded(
        child: Column(
          children: [
            Text(
              'Title :${companyInfo.title}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Date :${companyInfo.createdAt}'),
            Text('Description :${companyInfo.description}'),
          ],
        ),
      ),
    );
  }
}
