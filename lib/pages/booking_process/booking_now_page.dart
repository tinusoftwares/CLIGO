import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_strings.dart';
import '../../common/shimmer_loading.dart';
import '../../controllers/booking/dynamic_seat_plan_controller.dart';
import '../../controllers/country_controller/CountryController.dart';
import '../../controllers/trip/find_ticket_trip_controller.dart';
import '../profile_settings/profile_page.dart';
import '../widgets/booking_now_card_widget.dart';
import '../widgets/ctm_drawer_widget.dart';

class BookingNowPage extends StatefulWidget {
  String journeyDate;

  BookingNowPage({required this.journeyDate});

  @override
  State<StatefulWidget> createState() {
    return _BookingNowPageState();
  }
}

class _BookingNowPageState extends State<BookingNowPage> {
  CountryController countryController = Get.put(CountryController());
  FindTicketTripController findTicketTripController =
      Get.put(FindTicketTripController());

  DynamicSeatPlanController dynamicSeatPlan = DynamicSeatPlanController();

  ShimmerLoading _shimmerLoading = ShimmerLoading();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(CtmStrings.bookingTicketTitle,
            style: TextStyle(color: CtmColors.appWhiteColor, fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
          iconTheme: IconThemeData(color: CtmColors.appWhiteColor),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ])),
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
                        border: Border.all(width: 0, color: CtmColors.appWhiteColor),
                        color: CtmColors.appWhiteColor,
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
                        color: CtmColors.greyColor300,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Obx(() {
          if (findTicketTripController.isDataLoading.value) {
            if (findTicketTripController.findTicketsList.length == 0) {
              /// Image Set up
              return _shimmerLoading.buildShimmerBookingTicketsLV(150.5);
            } else {
              return _buildBooking();
            }
          } else {
            return _shimmerLoading.buildShimmerBookingTicketsLV(150.5);
            //return Center(child: CircularProgressIndicator());
          }
        }));
  }

  Widget _buildBooking() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(1, 5, 1, 2),
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              findTicketTripController.findTicketsList.length,
                          itemBuilder: (context, index) {
                            return BookingNowCardWidget(
                                findTicketTripController.findTicketsList[index],
                                widget.journeyDate.toString());
                          }),
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
