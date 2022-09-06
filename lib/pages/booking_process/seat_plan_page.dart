import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/ctm_colors.dart';
import '../../common/ctm_strings.dart';
import '../../common/theme_helper.dart';

import '../../controllers/booking/dynamic_seat_plan_controller.dart';
import '../profile_settings/profile_page.dart';

class SeatPlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SeatPlanPageState();
  }
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  DynamicSeatPlanController dynamicSeatPlanController =
      Get.put(DynamicSeatPlanController());

  List selected = [];
  int? selecteditem;

  @override
  Widget build(BuildContext context) {
    return seat();
  }

  seat() {
    return Obx(() {
      if (dynamicSeatPlanController.seats.length == 0) {
        return Text('No data');
      } else {
        List layout = dynamicSeatPlanController.seats;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Column(
            children: layout.map((col) {
              List items = col;
              return Row(
                children: items.map((row) {
                  if (row == null) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TextButton(onPressed: () {}, child: Text('')),
                    );
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            /// Setting Part Fetch Data 
                            CtmStrings.currencySymbol.toString();
                            String maxSeatNo = CtmStrings.maxTicket;
                            print('maxSeatNo :'+maxSeatNo);
                            
                            setState(() {



                              /// Setting Info

                              print('selected seat lng :'+selected.length.toString());
                              int selectSeatLng=selected.length;
                              

                              if (selected.contains(row['seatNumber'])) {
                                

                                selected.remove(row['seatNumber']);
                              } else {

                                if(selectSeatLng<4){
                                  selected.add(row['seatNumber']);
                                }else{
                                  Get.snackbar(
                                      'Alert', 'Sorry, you can not book more than 4 seats at a time',backgroundColor: CtmColors.appWhiteColor,colorText: CtmColors.appRedColor);
                                }
                              }

                              print('items :' + jsonEncode(selected.toString()));

                              /* setState(() {
                               // selecteditem = int.parse(row);
                              });*/
                            });
                          },
                          child: Container(
                            color: selected.contains(row['seatNumber'])
                                // selected.contains(row['seatNumber'])
                                ? Colors.grey
                                : Colors.green.shade200,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 2),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 0),
                            height: 55,
                            width: 52,
                            child: Center(
                              child:

                              Text(
                                row['seatNumber'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }).toList(),
              );
            }).toList(),
          ),
        );
      }
    });
  }
}
