import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_info/company_info_controller.dart';
import '../../models/company_info_model.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  CompanyInfoController companyInfoController =
      Get.put(CompanyInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (companyInfoController.isDataLoadingUs.value) {
            CompanyInfoModel companyInfo =
                companyInfoController.companyAboutUs.value;
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
          Text('Date :${companyInfo.createdAt}'),
          Text('Description :${companyInfo.description}'),
        ],
      ),
    );
  }
}
