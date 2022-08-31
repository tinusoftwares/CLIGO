
import 'package:flutter/material.dart';

import '../../models/booking_history_model.dart';
import '../widgets/booking_details_card_widget.dart';
import '../widgets/ctm_header_widget.dart';

class BookingHistoryDetailsPage extends StatefulWidget {

  BookingHistoryModel bookingHistoryModel;


  BookingHistoryDetailsPage(this.bookingHistoryModel);

  @override
  State<BookingHistoryDetailsPage> createState() => _BookingHistoryDetailsPageState();
}

class _BookingHistoryDetailsPageState extends State<BookingHistoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Booking Details"),
      ),
      body: _buildBooking(),
    );
  }

  Widget _buildBooking(){
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [
                SizedBox(height: 100,),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(1, 10, 1, 5),
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Booking Details",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      BookingDetailsCardWidget(widget.bookingHistoryModel)

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
