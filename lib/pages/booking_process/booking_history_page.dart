import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../controllers/booking/booking_history_controller.dart';
import '../../models/booking_history_model.dart';
import 'booking_history_deatils_page.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  BookingHistoryController _bookingHistoryController = Get.put(BookingHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Booking History"),

      ),
      body:


      Obx(() {
        if(_bookingHistoryController.isDataLoading.value){
          if (_bookingHistoryController.bookingHistoryList.length == 0) {
            return Center(child: Text(' Booking tickets are not available '));
          } else {
            return _buildBookingBody();
          }
        } else{
          return Center(child: CircularProgressIndicator());
        }

      })


    );
  }

  _buildBookingBody(){
    return Container(
      child: _buildBkHistoryCard(),
    );
  }

 ListView  _buildBkHistoryCard(){
    return   ListView.builder(
      itemCount: _bookingHistoryController.bookingHistoryList.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
      itemBuilder: ( BuildContext context, index){

        BookingHistoryModel bookingInfo= _bookingHistoryController.bookingHistoryList[index];

        return InkWell(
           onTap: (){
             Get.to(BookingHistoryDetailsPage(bookingInfo));
           },
          child: Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.airplane_ticket_outlined),
              title: Text(' Booking Id : '+bookingInfo.bookingId.toString(),style: TextStyle(fontSize: 14),),
              subtitle: Text("Payment Status : "+bookingInfo.paymentStatus.toString(),style: TextStyle(fontSize: 12)),
              trailing:
              bookingInfo.paymentStatus.toString()=='paid'?
              Icon(Icons.arrow_forward,size: 20): _unpaidPaymentOption()
            ),
          ),
        );
      },

    );

  }

  _unpaidPaymentOption(){
    return   Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Text(
                'Payment',
                style: ctmPaymentBtnTxtStyleSize14,
              ),
            ],
          ),
        ),
        onPressed: () {
           /// Payment Click
          print('Payment Here ');
        },
      ),
    );
  }


}
