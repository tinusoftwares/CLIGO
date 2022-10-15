
import 'package:flutter/material.dart';
import '../../common/ctm_strings.dart';

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
      appBar:
      AppBar(
        title: Text(CtmStrings.bookingDetailsTitle),
      ),
      body: _buildBooking(),
    );
  }

  Widget _buildBooking(){
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: BookingDetailsCardWidget(widget.bookingHistoryModel)
          )
        ],
      ),
    );
  }
}
