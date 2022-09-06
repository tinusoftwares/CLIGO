import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/company_info/company_info_controller.dart';
import '../../models/company_info_model.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  CompanyInfoController companyInfoController =
      Get.put(CompanyInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Policy '),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (companyInfoController.isDataLoadingPolicy.value) {
            CompanyInfoModel companyInfo =
                companyInfoController.companyPolicy.value;
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
