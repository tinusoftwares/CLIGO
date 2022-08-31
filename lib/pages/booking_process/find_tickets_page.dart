import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../controllers/country_controller/CountryController.dart';
import '../../controllers/trip/find_ticket_trip_controller.dart';
import '../../local_db_sqflite/db_helper.dart';
import '../profile_settings/profile_page.dart';
import '../widgets/ctm_drawer_widget.dart';
import '../widgets/ctm_header_widget.dart';
import 'booking_now_page.dart';

class FindTicketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindTicketPageState();
  }
}

class _FindTicketPageState extends State<FindTicketPage> {
  CountryController countryController = Get.put(CountryController());

  FindTicketTripController findTicketTripController =
      Get.put(FindTicketTripController());
  String? countryIdForm;
  String? countryIdTo;
  DateTime selectedDateDepart = DateTime.now();
  DateTime? pickCalDate;
  DateTime selectedDateReturn = DateTime.now();
  String returnDateFormatText = 'mm-dd-yyyy';
  bool isCheckDrop = false;
  DropdownMenuItem dropdownMenuItem = DropdownMenuItem(child: Text(''));

  /// Return ticket Date Picker
  Future<void> _selectDateDepart(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateDepart,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print("object");

    print(picked);
    if (picked != null && picked != selectedDateDepart) {
      setState(() {
        selectedDateDepart = picked;
      });
    }
  }

  /// Return ticket Date Picker
  Future<void> _selectDateReturn(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateReturn,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateReturn) {
      setState(() {
        selectedDateReturn = picked;
        returnDateFormatText = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('token :' + DBHelper.object.getToken().toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Find Tickets",
            style: TextStyle(color: Colors.white),
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
                  ]),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
                right: 16,
              ),
              child: Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 0, color: Colors.white),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 50,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: _buildBooking());
  }

  /// find tickets body Method
  Widget _buildBooking() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 100,
            child: HeaderWidget(100, false, Icons.house_rounded),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Find your bus ticket",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  width: 190,
                                  // height: 120,
                                  child: Card(
                                    elevation: 2,
                                    child: ListTile(
                                      dense: true,
                                      isThreeLine: true,
                                      //    leading: Icon(Icons.email),
                                      title: Text(
                                        "Form",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),

                                      subtitle: _countryListForm(),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  width: 180,
                                  height: 100,
                                  child: Card(
                                    elevation: 2,
                                    child: ListTile(
                                      dense: true,
                                      isThreeLine: true,
                                      title: Text(
                                        "To",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      subtitle: _countryListTo(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              top: 30,
                              left: 175,
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 15,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 12,
                                    ),
                                    Icon(
                                      Icons.arrow_back,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          /// Click Date
                          // print('Current Date : ' + selectedDateDepart.toIso8601String());
                          // var day = selectedDateDepart.day;
                          // var month = selectedDateDepart.month;
                          // var year = selectedDateDepart.year;
                          // var currentDate = day + month + year;
                          // DateTime dt2 = DateTime.parse("2018-02-27 10:09:00");
                          // print('currentDate' + currentDate.toString());

                          print(selectedDateReturn);

                          if (selectedDateDepart.compareTo(selectedDateReturn) <
                              0) {
                            print("date is ok");
                          }

                          if (selectedDateDepart.compareTo(selectedDateReturn) >
                              0) {
                            print("DT1 is after DT2");
                          }

                          _selectDateDepart(context);
                        },
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            trailing: Icon(
                              Icons.calendar_month,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text("Departure"),
                            subtitle: Text(
                                selectedDateDepart.toString().substring(0, 10)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          /// Click Date
                          print('Current Date : ' +
                              selectedDateReturn.toIso8601String());
                          var day = selectedDateReturn.day;
                          var month = selectedDateReturn.month;
                          var year = selectedDateReturn.year;
                          var currentDate = day + month + year;
                          print('currentDate' + currentDate.toString());
                          _selectDateReturn(context);
                        },
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            trailing: Icon(
                              Icons.calendar_month,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text("Return(Optional)"),
                            subtitle: Text(returnDateFormatText),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _buildFindTicketBtn(),
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

  /// Location form country id
  _countryListForm() {
    return Obx(() {
      return DropdownButton(
        isExpanded: true,
        isDense: true,
        value: countryIdForm,
        hint: Text(
          "Select Area",
        ),
        items: countryController.countryWiseAreaLocationList.map((country) {
          return DropdownMenuItem(
            child: Text(
              country.name.toString(),
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 12),
            ),
            value: country.id,
          );
        }).toList(),
        onChanged: (String? countryFormId) {
          setState(() {});
          countryIdForm = countryFormId ?? "";
          print("You selected Form : $countryFormId");
        },
      );
    });
  }

  /// Location form country id
  _countryListTo() {
    return Obx(() {
      return DropdownButton(
        isDense: true,
        isExpanded: true,
        value: countryIdTo,
        hint: Text(
          "Select Area",
        ),
        items: countryController.countryWiseAreaLocationList.map((country) {
          return DropdownMenuItem(
            child: Text(
              country.name.toString(),
              style: TextStyle(fontSize: 12),
            ),
            value: country.id,
          );
        }).toList(),
        onChanged: (String? countryToId) {
          setState(() {});
          countryIdTo = countryToId ?? "";
          print("You selected To: $countryToId");
        },
      );
    });
  }

  /// find tickets button action method
  _buildFindTicketBtn() {
    return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.find_in_page_sharp,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Find Tickets',
                style: ctmPaymentBtnTxtStyle,
              ),
            ],
          ),
        ),
        onPressed: () {
          Map<String, dynamic> findTicketsMapBody = {
            "pick_location_id": countryIdForm,
            "drop_location_id": countryIdTo,
            "journeydate": selectedDateDepart.toString(),
          };

          print('fTicketBodyMap: ' + findTicketsMapBody.toString());

          if (countryIdForm != null && countryIdTo != null) {
              findTicketTripController.findTicketsTripCTR(findTicketsMapBody);
              print('JData : ' + selectedDateDepart.toString().substring(0, 10),);
              Get.to(BookingNowPage(journeyDate: selectedDateDepart.toString().substring(0, 10)));
          }

          else {
            Get.snackbar('Alert ', "Please select the location",
                backgroundColor: Colors.white);
          }
        },
      ),
    );
  }
}
