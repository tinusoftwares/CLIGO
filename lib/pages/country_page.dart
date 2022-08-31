/*
import 'package:fabricslagbe/common_widgets/components/custom_button.dart';
import 'package:fabricslagbe/common_widgets/components/employer_drawer_menu.dart';
import 'package:fabricslagbe/controllers/employee_controller/employee_profile_details_controller.dart';
import 'package:fabricslagbe/controllers/employeer_controllers/employeer_home_controller.dart';
import 'package:fabricslagbe/controllers/employeer_controllers/employer_categoriesController.dart';
import 'package:fabricslagbe/helpers/colors.dart';
import 'package:fabricslagbe/helpers/text_style_format.dart';
import 'package:fabricslagbe/models/employeer_models/employee_search_list_model.dart';
import 'package:fabricslagbe/views/job_views/employeer/choose_expertise/imployee_profile_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerDashboardPage extends StatelessWidget {
  final EmployerCategoriesController _employerCategoriesController =
  Get.find<EmployerCategoriesController>();

  final EmployeeProfileController _empProfileController =
  Get.find<EmployeeProfileController>();

  final EmployeerHomeController _employerHomeController =
  Get.find<EmployeerHomeController>();

  var _industry, _subCategory, _employeeType;
  Map<String, String> _employeeSearchingFieldId = {};
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
      key: _drawerKey,
      drawer: EmployerDrawerMenu(),
      appBar: AppBar(
        title: Text('Employer Dashboard'),
      ),
      body: _chooseExpertiseBody(),
    );
  }

  _chooseExpertiseBody() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(height: 10),
              Text('Industry',
                  style: TextStyle(fontSize: 12, color: Colors.green)),
              _garmentsFactoryList(),
              SizedBox(height: 20),
              Text('Sub Category',
                  style: TextStyle(fontSize: 12, color: Colors.green)),
              _subCategoryList(),
              SizedBox(height: 20),
              Text('Employee Type',
                  style: TextStyle(fontSize: 12, color: Colors.green)),
              _categoryTypeList(),
              SizedBox(height: 20),
              _employeeSearchBTN(),
              _buildEmployeeSearchInfo()
            ],
          ),
        ),
      );
    });
  }

  _garmentsFactoryList() {
    return DropdownButtonFormField(
      // focusNode: _divisionNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        // border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(Icons.home),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorStyle: errorStyle,
        hintText: 'Garments Factory',
      ),
      value: _industry,
      items: _employerCategoriesController.industryList.map((industry) {
        return DropdownMenuItem<String>(
          value: industry.id.toString(),
          child: Text(industry.name.toString()),
        );
      }).toList(),
      validator: (value) {
        if (value == null) return "industry is required";
        return null;
      },
      onChanged: (value) {
        _employeeSearchingFieldId
            .addAll({'industry_category_id': value.toString()});
        _employerCategoriesController
            .getEmployerSubCategoryList(value.toString());
      },
    );
    //});
  }

  _subCategoryList() {
    return DropdownButtonFormField(
      // focusNode: _divisionNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        // border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(Icons.category),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorStyle: errorStyle,
        hintText: 'Sub Category List ',
      ),
      value: _subCategory,
      items: _employerCategoriesController.subCategoryList.map((category) {
        return DropdownMenuItem<String>(
          value: category.id.toString(),
          child: Text(category.name.toString()),
        );
      }).toList(),
      validator: (value) {
        if (value == null) return "category is required";
        return null;
      },
      onChanged: (value) {
        _employeeSearchingFieldId
            .addAll({'industry_sub_category_id': value.toString()});
        _employerCategoriesController.getEmployeeTypeList(value.toString());
      },
    );
  }

  _categoryTypeList() {
    return DropdownButtonFormField(
      // focusNode: _divisionNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        // border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(Icons.merge_type),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorStyle: errorStyle,
        hintText: 'Type',
      ),
      value: _employeeType,
      items: _employerCategoriesController.employeeType.map((empType) {
        return DropdownMenuItem<String>(
          value: empType.id.toString(),
          child: Text(empType.name.toString()),
        );
      }).toList(),
      validator: (value) {
        if (value == null) return "Employee Type is required";
        return null;
      },
      onChanged: (value) {
        _employeeSearchingFieldId
            .addAll({'industry_employee_type_id': value.toString()});
      },
    );
  }

  /// employee Searching
  _employeeSearchBTN() {
    return GestureDetector(
      onTap: () {
        print('Employee Search ...');
        _employerHomeController.getEmployerSearch(_employeeSearchingFieldId);
      },
      child: Center(
        child: Container(
          height: 48,
          width: 110,
          color: kSuccessColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Text(
                'SEARCH',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Employee Search List Profile
  Widget _buildEmployeeSearchInfo() {
    return Obx(() {
      if (_employerHomeController.isEmployeeSearch.value == false) {
        return Center(child: Text('No Data Found '));
      } else if (_employerHomeController.isEmployeeSearch.value == true &&
          _employerHomeController.employeeSearchList.isEmpty) {
        return Center(
          child: CupertinoActivityIndicator(),
        );
      } else {
        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _employerHomeController.employeeSearchList.length,
            itemBuilder: (context, index) {
              EmployeeSearchModel empSearch =
              _employerHomeController.employeeSearchList[index];
              return Card(
                elevation: 2,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                empSearch.name.toString(),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.purple),
                              ),
                              Text(
                                empSearch.age.toString(),
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 2),
                              Divider(
                                height: .2,
                                thickness: .2,
                                color: Colors.black,
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                          subtitle: Text(
                            empSearch.expectedSalary.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomeButton(
                          text: 'Profile',
                          press: () {
                            print('empId :' + empSearch.id.toString());

                            Get.defaultDialog(
                              backgroundColor: primaryLightColor,
                              title: 'Loading...',
                              radius: 20.0,
                              content: CupertinoActivityIndicator(
                                animating: true,
                                radius: 10.0,
                              ),
                            );

                            _empProfileController.employeeProfileDetails(
                                empSearch.id.toString());
                            Get.back();
                            Get.to(EmployeeProfileDetails());
                          },
                          color: Colors.purple,
                          //kSuccessColor,
                          right: 10,
                          left: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
*/
