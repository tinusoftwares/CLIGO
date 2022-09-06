import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/ctm_colors.dart';
import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../models/booking_history_model.dart';
import 'ctm_review_card_widget.dart';

class BookingDetailsCardWidget extends StatelessWidget {

  BookingHistoryModel bookingHistoryInfo;


  BookingDetailsCardWidget(this.bookingHistoryInfo);

  String policyString =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      height: 450,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: _buildBookingHistoryDetailsCardUI(context),
      ),
    );
  }

  ///Booking Details
  _buildBookingHistoryDetailsCardUI(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Card(
            color: Theme.of(context).primaryColor,
            elevation: 15,
            child: Container(
              decoration: BoxDecoration(
                color:CtmColors.appWhiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:Radius.circular(50) ),
              ),
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
              child: Column(
                children: [
                  customTextFormatWithValueRowLine('Booking Id ', bookingHistoryInfo.bookingId.toString()),
                  customTextFormatWithValueRowLine('Amount', bookingHistoryInfo.paidamount.toString()),
                  customTextFormatWithValueRowLine('Payment Status ', bookingHistoryInfo.paymentStatus.toString()),
                ],
              ),
            ),
          ),






          Card(
            color: Theme.of(context).primaryColor,
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                color:CtmColors.appWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 1,
                      child: customTextFormatWithValueWithIconRowLine(
                          'Drop ', 'Dhaka',Icon(Icons.add_location,size: 16,))),
                  Expanded(
                      flex: 1,
                      child: customTextFormatWithValueWithIconRowLine(
                          'PickUp ', 'Rangpur',Icon(Icons.add_location,size: 16,))),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),


          customTextFormatWithValueRowLine('Facilites', bookingHistoryInfo.offerer??''),
          customTextFormatWithValueRowLine('Seat Numbers', bookingHistoryInfo.seatnumber.toString()),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 2,
                  child: customTextFormatWithValueRowLine('Special', bookingHistoryInfo.special.toString())),
              Expanded(
                  flex: 2,
                  child: customTextFormatWithValueRowLine('Adult', bookingHistoryInfo.adult.toString())),
              Expanded(
                  flex: 2,
                  child: customTextFormatWithValueRowLine('Child', bookingHistoryInfo.chield.toString())),
              Expanded(
                  flex: 3,
                  child: customTextFormatWithValueRowLine('total seat', bookingHistoryInfo.totalseat.toString())),
            ],
          ),



          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: customTextFormatWithValueRowLine('Discount', bookingHistoryInfo.discount.toString())),
              Expanded(
                  flex: 1,
                  child: customTextFormatWithValueRowLine(' Type', 'Cash')),
            ],
          ),



          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 1,
                  child: customTextFormatWithValueRowLine('review', bookingHistoryInfo.reviewStatus.toString())),
              Expanded(
                  flex: 1,
                  child: customTextFormatWithValueRowLine('Booking Status', bookingHistoryInfo.cancelStatus.toString())),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),


          /// if offer active then show otherwise don't show
//        customTextFormatWithValueRowLine('Offer  ', '3500'),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [


              Expanded(
                  flex: 1,
                  child:
                  Container()),

              Expanded(
                flex: 3,
                child:
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                    child: customTextFormatWithValueRowLine('Booking Date', bookingHistoryInfo.journeydata.toString())),),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [


              Expanded(
                  flex: 2,
                  child:
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                              Icons.share,
                              size: 18,
                              color: CtmColors.appWhiteColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Share ',
                              style: ctmPaymentBtnTxtStyleSize14,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {

                      },
                    ),
                  ),
              ),

              Expanded(
                flex: 3,
                child:
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
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
                            Icons.download,
                            size: 18,
                            color: CtmColors.appWhiteColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Download PDF File ',
                            style: ctmPaymentBtnTxtStyleSize14,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
  ///Format Row Line Text Format
  Widget customTextFormatWithValueRowLine(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text(key + ' : ',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  ///Format Row Line Text With Icon Format
  Widget customTextFormatWithValueWithIconRowLine(String key, String value,Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Wrap(
        children: [
          icon,
          Text(key + ' : ',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  /// Bottom Sheet Review

  Widget _buildBottomSheetReviews(){
    return CtmReviewCardWidget();
  }


}
