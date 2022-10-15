import 'package:flutter/material.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_strings.dart';
import '../../common/ctm_style.dart';
import '../../models/find_tickets_trip_list_model.dart';
import '../../pages/review_section/reviews.dart';
import 'package:get/get.dart';
import '../../common/theme_helper.dart';
import '../../controllers/booking/dynamic_seat_plan_controller.dart';
import '../../local_db_sqflite/db_helper.dart';
import '../../local_db_sqflite/db_helper_local.dart';
import '../booking_process/pickup_and_drop_page.dart';
import '../photos_section/photos_page.dart';
import 'ctm_review_card_widget.dart';

class BookingNowCardWidget extends StatelessWidget {
  String policyString =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  FindTicketListModel ticketListModel;
  String journeydate = '';
  String tripId = '';
  BookingNowCardWidget(this.ticketListModel, this.journeydate);

  bool isShow = false;

  DynamicSeatPlanController dynamicSeatPlanController =
      Get.put(DynamicSeatPlanController());

  @override
  Widget build(BuildContext context) {
    print('money Symbel : '+CtmStrings.currencySymbol.toString());

    tripId = ticketListModel.tripid.toString();
    journeydate = journeydate.toString();
    print(' tripId +Date :' + tripId + ' ' + journeydate);

    /// this controller need to dynamic seat
    dynamicSeatPlanController.dynamicSeatPan(tripId, journeydate);
    return Container(
      //color: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      height: MediaQuery.of(context).size.height/3,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: _buildLeftCardUI(context),
            ),
            Expanded(
              flex: 5,
              child: _buildRightCardUI(context),
            ),
          ],
        ),
      ),
    );
  }

  ///left site
  _buildLeftCardUI(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          ctmTextFormatValueRow('Name', '', ticketListModel.companyName ?? 'no compnay'),
          ctmTextFormatValueRow('Departure', '',ticketListModel.startTime ?? '00:00' + '[' + 'Dhaka' + ']'), // dhaka find tickets arg pass
          ctmTextFormatValueRow('Arrival','', ticketListModel.endTime ?? '00:00' + '[' + 'Dhaka' + ']'),

          SizedBox(height: 10),

          InkWell(
            onTap: () {
              print('Photos Click');
              Get.to(PhotoPage());
            },
            child: Container(

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image,size: 18,color: Theme.of(context).primaryColor,),
                    SizedBox(width: 5,),
                    Center(child: Text('Photos',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),),
                  ],
                )),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              print('Policy Click');
              _buildAlertPolicy(context);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 1),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child:
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.policy,size: 18,color: Theme.of(context).primaryColor,),
                    SizedBox(width: 5,),
                    Center(child: Text('Policy',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),),
                  ],
                )
                /*Center(child: Text('Policy',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)

                )*/
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              print('Review Click ');

              Get.to(Reviews());
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child:
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.reviews,size: 18,color: Theme.of(context).primaryColor,),
                    SizedBox(width: 5,),
                    Center(child: Text('Reviews',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),),
                  ],
                )
                //Center(child: Text('Reviews',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),))
            ),
          ),
        ],
      ),
    );
  }

  ///Right site
  _buildRightCardUI(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2,horizontal: 0),
      // color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ticketListModel.specialFair == ""
              ? Container() : ctmTextFormatValueRow('Special Fare', CtmStrings.currencySymbol,  ticketListModel.specialFair ?? '0'),

          ticketListModel.childFair == "" ? Container() : ctmTextFormatValueRow('Child Fare',CtmStrings.currencySymbol, ticketListModel.childFair ?? '0'),
          ticketListModel.adultFair == "" ? Container() : ctmTextFormatValueRow('Adult Fare',CtmStrings.currencySymbol, ticketListModel.adultFair ?? '0'),
          ctmTextFormatValueRow('Duration','', ticketListModel.journeyHour ?? 'hours' + ' hrs'),
          ctmTextFormatValueRow('Available','', ticketListModel.availableSeat.toString()),

          ///todo rating in future modify
          ctmTextFormatValueRow('Rating', '',ticketListModel.rating ?? '0.0'),

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
                      Icons.book_online,
                      size: 18,
                      color: CtmColors.appWhiteColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Book Now', style: ctmPaymentBtnTxtStyleSize14,),
                  ],
                ),
              ),
              onPressed: () {
                print('token main :' + DBHelper01.getToken('token').toString());
                print('booking process step-3');
                if (DBHelper01.getToken('token') != null) {
                  Get.to(PickupAndDropPage(ticketListModel));
                } else {
                  Get.toNamed('/login');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  ///Format Row Line Text Format
  Widget ctmTextFormatValueRow(String key, String currencySymbol, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text(key + ' : ',
              style: ctmTxtFormatKeyStyle),
          Text(
            currencySymbol +' '+ value,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  /// Alert Info  Policy
  _buildAlertPolicy(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(" Policy "),
        content: Text(policyString),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 18, color: CtmColors.appWhiteColor),
                )),
          ),
        ],
      ),
    );
  }




  /// Bottom Sheet Review

  Widget _buildReviews() {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: CtmReviewCardWidget());
      },
    );
  }
}
