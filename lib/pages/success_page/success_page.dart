

import 'package:flutter/material.dart';
import '../../common/ctm_colors.dart';
import '../../pages/booking_process/booking_history_page.dart';
import '../../pages/booking_process/find_tickets_page.dart';
import 'package:get/get.dart';

import '../../common/theme_helper.dart';

class SuccessFulPage extends StatelessWidget {
  const SuccessFulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             // Container(child: Text('Ticket booking has successful',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),),
              SizedBox(height: 10),

              Container(child: Text('Thank You ',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),),

              SizedBox(height: 50),
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                    child: Icon(Icons.done_all,size: 50,)),
              ),
              SizedBox(height: 50),
              Container(child: Text('Ticket booking done successfully',style: TextStyle(fontSize: 10))),
              SizedBox(height: 20,),
              Container(child: Text('You Will be redirected to the home page shortly\n or click here to return to home page  ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),),
              SizedBox(height: 50,),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(context),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.home,
                          size: 18,
                          color: CtmColors.appWhiteColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CtmColors.appWhiteColor),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                      Get.offAll((FindTicketPage()));

                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(context),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.history,
                          size: 18,
                          color: CtmColors.appWhiteColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Booking History ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CtmColors.appWhiteColor),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Get.to(BookingHistoryPage());

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
