

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/theme_helper.dart';
import '../booking_process/booking_history_page.dart';
import '../booking_process/find_tickets_page.dart';

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
              Container(child: Text('Ticket booking has successful',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),),
              SizedBox(height: 10),
              Container(child: Image.network('https://meetanshi.com/media/catalog/product/cache/ccb305b1061c785de33da9c79e0526ce/m/2/m2-success-page-product-image-380x410.png',height: 300,width: 300,)),
              SizedBox(height: 50,),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.home,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                      Get.to(FindTicketPage());

                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.history,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Booking History ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
