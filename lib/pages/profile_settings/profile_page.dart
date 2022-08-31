import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/profile/profile_controller.dart';
import '../../models/profile_info_model.dart';
import '../authentication/forgot_password_page.dart';
import '../authentication/forgot_password_verification_page.dart';
import '../authentication/registration_page.dart';
import '../booking_process/booking_now_page.dart';
import '../widgets/ctm_drawer_widget.dart';
import '../widgets/ctm_header_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController profileController = Get.put(ProfileController());

  /// init value
  String? passengerFirstName;
  String? passengerLastName;
  String? passengerEmail;
  String? passengerMobile;
  String? passengerIdNumber;
  String? passengerIdType;
  String? passengerCountryId;
  String? passengerCountryCity;
  String? passengerAddress;
  String? passengerStatus;
  String? passengerZipCode;
  String? passengerSlug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
      drawer: DrawerWidget(),
      body: Obx(() {
        if (profileController.isLoadingData.value) {
          ProfileInfoModel profileInfo = profileController.profile.value;
          return _buildProfileBody(profileInfo);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  _buildProfileBody(ProfileInfoModel profileInfo) {
    passengerFirstName = profileInfo.firstName;
    passengerLastName = profileInfo.lastName;
    passengerEmail = profileInfo.loginEmail;
    passengerMobile = profileInfo.loginMobile;
    passengerIdNumber = profileInfo.idNumber;
    passengerIdType = profileInfo.idType;
    passengerCountryId = profileInfo.countryId;
    passengerCountryCity = profileInfo.city;

    passengerAddress = profileInfo.address;

    var address = passengerAddress! + passengerCountryCity!;

    passengerStatus = profileInfo.status;
    passengerZipCode = profileInfo.zipCode;
    passengerSlug = profileInfo.slug;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 100,
            child: HeaderWidget(100, false, Icons.house_rounded),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 5, color: Colors.white),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "User Information",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Card(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        leading: Icon(Icons.my_location),
                                        title: Text("Name"),
                                        subtitle: Text(passengerFirstName!+ ' ' + passengerLastName!),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text("Email"),
                                        subtitle: Text(passengerEmail ?? ''),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.phone),
                                        title: Text("Phone"),
                                        subtitle: Text(passengerMobile ?? ''),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person),
                                        title: Text("Address"),
                                        subtitle: Text(address),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
