import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/ctm_style.dart';
import '../../common/theme_helper.dart';
import '../../controllers/booking/dynamic_seat_plan_controller.dart';
import '../../local_db_sqflite/db_helper.dart';
import '../../models/find_tickets_trip_list_model.dart';
import '../booking_process/pickup_and_drop_page.dart';
import '../photos_section/photos_page.dart';
import '../review_section/reviews.dart';
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
    tripId = ticketListModel.tripid.toString();
    journeydate = journeydate.toString();
    print(' tripId +Date :' + tripId + ' ' + journeydate);

    /// this controller need to dynamic seat
    dynamicSeatPlanController.dynamicSeatPan(tripId, journeydate);
    return Container(
      //color: Colors.green,
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      height: 210,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: _buildLeftCardUI(context),
            ),
            Expanded(
              flex: 2,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customTextFormatWithValueRowLine(
              'Name', ticketListModel.companyName ?? 'no compnay'),

          customTextFormatWithValueRowLine(
              'Departure',
              ticketListModel.startTime ??
                  '00:00' + '[' + 'Dhaka' + ']'), // dhaka find tickets arg pass
          customTextFormatWithValueRowLine('Arrival',
              ticketListModel.endTime ?? '00:00' + '[' + 'Dhaka' + ']'),

          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    child: Text('Photos')),
              ),
              InkWell(
                onTap: () {
                  print('Review Click ');
                  // _buildReviews();
                  Get.to(Reviews());
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    child: Text('Reviews')),
              ),
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
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    child: Text('Policy')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///Right site
  _buildRightCardUI(BuildContext context) {
    return Container(
      // color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ticketListModel.specialFair == ""
              ? Container()
              : customTextFormatWithValueRowLine(
                  'Special Fare', ticketListModel.specialFair ?? '0'),
          ticketListModel.adultFair == ""
              ? Container()
              : customTextFormatWithValueRowLine(
                  'Adult Fare', ticketListModel.adultFair ?? '0'),
          ticketListModel.childFair == ""
              ? SizedBox()
              : customTextFormatWithValueRowLine(
                  'Child Fare', ticketListModel.childFair ?? '0'),
          customTextFormatWithValueRowLine(
              'Duration', ticketListModel.journeyHour ?? 'hours' + ' hrs'),
          customTextFormatWithValueRowLine(
              'Available', ticketListModel.availableSeat.toString()),

          ///todo rating in future modify
          customTextFormatWithValueRowLine(
              'Rating', ticketListModel.rating ?? '0.0'),

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
                      Icons.book_online,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Book Now',
                      style: ctmPaymentBtnTxtStyleSize14,
                    ),
                  ],
                ),
              ),
              onPressed: () {
                print('token main :' + DBHelper.object.getToken().toString());
                print('booking process step-3');
                if (DBHelper.object.getToken() == null) {
                  Get.toNamed('/login');
                } else {
                  Get.to(PickupAndDropPage(ticketListModel));
                }
              },
            ),
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
              style: ctmTxtFormatKeyStyle),
          Text(
            value,
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
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
