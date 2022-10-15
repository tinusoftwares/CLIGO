import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../../common/ctm_alert_widget.dart';
import '../../common/ctm_colors.dart';
import '../../common/ctm_strings.dart';
import '../../common/ctm_style.dart';
import '../../controllers/trip/stand_dropping_borading_controller.dart';
import '../../pages/payment_method/pay_pal_payment.dart';
import '../../pages/success_page/success_page.dart';
import '../../repository/booking_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../common/theme_helper.dart';
import '../../controllers/country_controller/CountryController.dart';
import '../../controllers/profile/profile_controller.dart';
import '../../models/find_tickets_trip_list_model.dart';
import '../../models/profile_info_model.dart';
import '../profile_settings/profile_page.dart';
import '../widgets/ctm_textWith_key_value_icon_rowline_widget.dart';

class PaymentSystemPage extends StatefulWidget {
  FindTicketListModel ticketListModel;
  Map<String, dynamic> bookingInfoBodyMap;

  PaymentSystemPage(this.ticketListModel, this.bookingInfoBodyMap);

  @override
  State<PaymentSystemPage> createState() => _PaymentSystemPageState();
}

class _PaymentSystemPageState extends State<PaymentSystemPage> {
  String idType = '1';
  int _radioSelected = 1;
  int _subRadioSelected = 0;

  int _boardingRadioSelected = 1;
  int _droppingRadioSelected = 1;
  late Razorpay _razorpay;

  String? _radioVal;
  CountryController countryController = Get.put(CountryController());
  StandDroppingBoardingController _droppingBoardingController = Get.put(StandDroppingBoardingController());

  ProfileController profileController = Get.put(ProfileController());

  /// init Passenger  value
  String? passengerFirstName;
  String? passengerLastName;
  String? passengerEmail;
  String? passengerMobile;
  String? passengerIdNumber;
  String? passengerIdType;
  String? passengerCountryId;
  String? passengerCountryCity;
  String? passengerAddress;
  String? passengerStatus;
  String? passengerZipCode;
  String? passengerSlug;

  /// init Trip Value

  String? tripid;
  String? fleetId;
  String? scheduleId;
  String? pickLocationId;
  String? dropLocationId;
  String? vehicleId;
  String? distance;
  String? startdate;
  String? journeyHour;
  String? childSeat;
  String? specialSeat;
  String? adultSeat;
  String? adultFair;
  String? childFair;
  String? specialFair;
  String? weekend;
  String? companyName;
  String? stoppage;
  String? pickStand;
  String? dropStand;
  String? facility;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? type;
  String? layout;
  String? lastSeat;
  String? totalSeat;
  String? seatNumber;
  String? luggageService;
  String? startTime;
  String? endTime;
  String? regNo;
  String? engineNo;
  String? modelNo;
  String? chasisNo;
  String? woner;
  String? wonerMobile;
  String? company;
  String? assign;
  String? subtripId;
  String? tripId;
  String? show;
  String? imglocation;
  int? totalreview;
  String? rating;
  int? totalbooking;
  int? availableSeat;
  double totalPrice = 0.0;
  double subAmount = 0.0;
  double grandTotal = 0.0;
  double discount = 0.0;
  double tax = 0.0;
  Map<String, dynamic> bookingPayLaterMapBody = {};
  late  ProgressDialog pr;

  ///----------- online payment system -----------------
  String publicKeyTest = 'pk_test_328da55755b88b1aaed96c5cda215b2fd887edb9'; //pass in the public test key obtained from paystack dashboard here
  final plugin = PaystackPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    plugin.initialize(publicKey: publicKeyTest);
    profileController.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleRazorPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handleRazorPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalRazorWallet);

  }


  @override
  Widget build(BuildContext context) {
    pr=ProgressDialog(context);
    pr.style(
        message: 'Loading ...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );

    print('aseat Value :' + widget.bookingInfoBodyMap['aseat'].toString());
    adultSeat = widget.bookingInfoBodyMap['aseat'];
    print('cseat Value :' + widget.bookingInfoBodyMap['cseat'].toString());
    childSeat = widget.bookingInfoBodyMap['cseat'];
    print('spseat Value :' + widget.bookingInfoBodyMap['spseat'].toString());
    specialSeat = widget.bookingInfoBodyMap['spseat'];
    print('seatnumbers Value :' +
        widget.bookingInfoBodyMap['seatnumbers'].toString());

    print('totalseat Value :' +
        widget.bookingInfoBodyMap['totalseat'].toString());
    totalSeat = widget.bookingInfoBodyMap['totalseat'].toString();

    print('totalprice Value :' +
        widget.bookingInfoBodyMap['totalprice'].toString());
    totalPrice =
        double.parse(widget.bookingInfoBodyMap['totalprice'].toString());

    subAmount = totalPrice + tax;
    grandTotal = subAmount - discount;

    print('vehicle_id Value :' +
        widget.bookingInfoBodyMap['vehicle_id'].toString());
    vehicleId = widget.bookingInfoBodyMap['vehicle_id'].toString();

    FindTicketListModel ticketsInfo;
    ticketsInfo = widget.ticketListModel;

    tripid = ticketsInfo.tripId;
    _droppingBoardingController.standBoardingCTR(tripid.toString());
    _droppingBoardingController.standDroppingCTR(tripid.toString());

    fleetId = ticketsInfo.fleetId;
    scheduleId = ticketsInfo.scheduleId;
    pickLocationId = ticketsInfo.pickLocationId;
    dropLocationId = ticketsInfo.dropLocationId;
    vehicleId = ticketsInfo.vehicleId;
    distance = ticketsInfo.distance;
    startdate = ticketsInfo.startdate;
    journeyHour = ticketsInfo.journeyHour;
    childSeat = ticketsInfo.childSeat;
    specialSeat = ticketsInfo.specialSeat;
    adultFair = ticketsInfo.adultFair;
    childFair = ticketsInfo.childFair;
    specialFair = ticketsInfo.specialFair;
    weekend = ticketsInfo.weekend;
    companyName = ticketsInfo.companyName;
    stoppage = ticketsInfo.stoppage;
    facility = ticketsInfo.facility;
    status = ticketsInfo.status;
    createdAt = ticketsInfo.createdAt;
    updatedAt = ticketsInfo.updatedAt;
    deletedAt = ticketsInfo.deletedAt;
    type = ticketsInfo.type;
    layout = ticketsInfo.layout;
    lastSeat = ticketsInfo.lastSeat;
    totalSeat = ticketsInfo.totalSeat;
    seatNumber = ticketsInfo.seatNumber;
    luggageService = ticketsInfo.luggageService;
    startTime = ticketsInfo.startTime;
    endTime = ticketsInfo.endTime;
    regNo = ticketsInfo.regNo;
    engineNo = ticketsInfo.engineNo;
    modelNo = ticketsInfo.modelNo;
    chasisNo = ticketsInfo.chasisNo;
    woner = ticketsInfo.woner;
    wonerMobile = ticketsInfo.wonerMobile;
    company = ticketsInfo.companyName;
    assign = ticketsInfo.assign;
    subtripId = ticketsInfo.subtripId;
    tripId = ticketsInfo.tripId;
    show = ticketsInfo.show;
    imglocation = ticketsInfo.imglocation;
    totalreview = ticketsInfo.totalreview;
    rating = ticketsInfo.rating;
    totalbooking = ticketsInfo.totalbooking;
    availableSeat = ticketsInfo.availableSeat;

    return Scaffold(
      appBar: AppBar(
        title: Text(CtmStrings.paymentSystemTitle,
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
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
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: _buildPaymentSystem(),
      bottomNavigationBar: _buildPaymentButtonNavigation(),
    );
  }

  Widget _buildPaymentSystem() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(5, 2, 5, 5),
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Column(
                    children: <Widget>[
                      _buildPaymentTitleHeader('Travel Details'),
                      _buildTravelDetails(),
                      SizedBox(height: 10),

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildPaymentTitleHeader('Boarding point'),
                          _buildPaymentTitleHeader('Dropping point '),
                        ],
                      ),

                      _buildStand(),
                      SizedBox(height: 10),
                      _buildPaymentTitleHeader('Fare Summery'),
                      _buildFareSummery(),
                      SizedBox(height: 10),
                      _buildPaymentTitleHeader('Apply Discount'),
                      _buildApplyDiscount(),
                      SizedBox(height: 10),
                      _buildPaymentStepRadioBtn(),


                      /// not use final button
                      //  _buildPaymentButtonNavigation(),
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

  /// Title Header Name
  _buildPaymentTitleHeader(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Part One
  _buildTravelDetails() {
    return Obx(() {
      if (profileController.isLoadingData.value) {
        ProfileInfoModel profileInfo = profileController.profile.value;

        print('UI Profile : ' + profileInfo.toString());
        passengerFirstName = profileInfo.firstName;

        print('UI passengerFirstName : ' + passengerFirstName.toString());
        passengerLastName = profileInfo.lastName;
        var fulName = passengerFirstName! + passengerFirstName!;

        passengerEmail = profileInfo.loginEmail;
        passengerMobile = profileInfo.loginMobile;
        passengerIdNumber = profileInfo.idNumber;
        passengerIdType = profileInfo.idType;
        passengerCountryId = profileInfo.countryId;
        passengerCountryCity = profileInfo.city;
        passengerAddress = profileInfo.address;
        var address = passengerAddress! + passengerCountryCity!;
        passengerStatus = profileInfo.status;
        passengerZipCode = profileInfo.zipCode;
        passengerSlug = profileInfo.slug;

        return Card(
          elevation: 2,
          child: Container(
            height: 120,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CtmTextWithKeyValueIconRowLineWidget('', fulName, Icon(
                      Icons.person,
                      size: 18,
                    ),),
                CtmTextWithKeyValueIconRowLineWidget(
                    '',
                    passengerEmail,
                    Icon(
                      Icons.mail,
                      size: 18,
                    )),
                CtmTextWithKeyValueIconRowLineWidget('', passengerMobile,
                    Icon(
                      Icons.phone,
                      size: 18,
                    )),
                CtmTextWithKeyValueIconRowLineWidget('', address, Icon(Icons.location_on_sharp, size: 18,),),
              ],
            ),
          ),
        );
      } else {
        return Card(
          elevation: 2,
          child: Container(
            height: 80,
            width: double.infinity,
            child: Center(
              child: Text(CtmStrings.profileDataNFound),
            ),
          ),
        );
      }
    });
  }

  ///------------------------- Stand Point --------------------
  /// Part two
  _buildStand() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _standBoardingCardRadio()),
        Expanded(flex: 1, child: _standDroppingCardRadio())
      ],
    );
  }

  _standBoardingCardRadio() {
    return Obx(() {
      if (_droppingBoardingController.isDataLoadingBoarding.value) {
        if (_droppingBoardingController.standBoardingList.length == 0) {
          return Center(child: Text(CtmStrings.boardingStandNAvi));
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: _droppingBoardingController.standBoardingList.length,
              itemBuilder: (BuildContext context, int index) {
                var boarding = _droppingBoardingController.standBoardingList[index];
                print(boarding.id);
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Radio(
                              value: index,
                              groupValue: _boardingRadioSelected,
                              activeColor: Theme.of(context).primaryColor,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  _boardingRadioSelected = int.parse(value.toString());
                                  pickStand = boarding.id.toString();
                                  print('Select pickStand :' + pickStand.toString());
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Text(
                                boarding.time ?? '',
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              });
        }
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  _standDroppingCardRadio() {
    return Obx(() {
      if (_droppingBoardingController.isDataLoadingDropping.value) {
        if (_droppingBoardingController.standDroppingList.length == 0) {
          return Center(child: Text(' Dropping stand are not available '));
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: _droppingBoardingController.standDroppingList.length,
              itemBuilder: (BuildContext context, int index) {
                var dropping = _droppingBoardingController.standDroppingList[index];


                return Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Radio(
                          value: index,
                          groupValue: _droppingRadioSelected,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _droppingRadioSelected =
                                  int.parse(value.toString());
                              dropStand = dropping.id.toString();
                              print('Select drop  :' + dropStand.toString());
                            });
                          },
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Text(
                            dropping.time ?? '',
                            style: TextStyle(fontSize: 12),
                          )),
                    ],
                  ),
                );
              });
        }
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  _textformat({ctmKey, ctmValue}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Text(ctmKey!, style: ctmTxtFormatKeyStyle),
          ),
          Expanded(
            flex: 1,
            child: Text(
              " : " + ctmValue!,
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }

  /// Part Three
  _buildFareSummery() {
    return Card(
      elevation: 2,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 0, top: 15, right: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textformat(
                  ctmKey: 'Base Fare', ctmValue: '৳ ${totalPrice.toString()}'),
              _textformat(ctmKey: 'Tax', ctmValue: '৳ $tax'),
              _textformat(ctmKey: 'Subtotal Amount', ctmValue: '৳ $subAmount'),
              _textformat(ctmKey: 'Discount', ctmValue: '৳ $discount'),
              Divider(
                height: 10,
                thickness: 1.5,
              ),
              _textformat(ctmKey: 'Total Amount', ctmValue: '৳ $totalPrice'),
              // CtmTextWithKeyValueRowLineWidget(ctmKey: "Total Amount", ctmValue: "৳$totalPrice"),
            ],
          ),
        ),
      ),
    );
  }

  /// Part Four
  _buildApplyDiscount() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: ThemeHelper().textInputDecoration(
                        "promo code ", "Enter your promo code"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      return null;
                    },
                  ),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(context),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Apply',
                        style: ctmPaymentBtnTxtStyle,
                      ),
                    ),
                    onPressed: () {
                      print("Book Confirm done ");
                      //Get.toNamed('/payment_system');
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  /// Part Five
  _buildPaymentStepRadioBtn() {
    return Container(
        child: Column(
      children: [
        _radioButtonPayment(),
        SizedBox(height: 5),
        _radioSelected == 1
            ? Divider(
                height: 1,
                thickness: 1,
                color: Theme.of(context).primaryColor,
              )
            : Container(),
        _radioButtonSubPayment()
      ],
    ));
  }

  ///------------------------ Payment Option -------------------
  _radioButtonPayment() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _radioSelected,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = int.parse(value.toString());
                      _radioVal = 'Pay Now';
                    });
                  },
                ),
                Text('Pay Now'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _radioSelected,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = int.parse(value.toString());
                      _radioVal = 'Pay Later';
                    });
                  },
                ),
                Text('Pay Later'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _radioButtonSubPayment() {
    return _radioSelected == 1
        ? Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Expanded(
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _subRadioSelected,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _subRadioSelected = int.parse(value.toString());
                                _radioVal = 'paypal';
                              });
                            },
                          ),
                          Text('paypal'),
                        ],
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _subRadioSelected,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _subRadioSelected = int.parse(value.toString());
                                _radioVal = 'paystack';
                              });
                            },
                          ),
                          Text('paystack'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _subRadioSelected,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _subRadioSelected = int.parse(value.toString());
                                _radioVal = 'stripe';
                              });
                            },
                          ),
                          Text('stripe'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: _subRadioSelected,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _subRadioSelected = int.parse(value.toString());
                                _radioVal = 'razorpay';
                              });
                            },
                          ),
                          Text('razorpay'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
             /* Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _subRadioSelected,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _subRadioSelected = int.parse(value.toString());
                                _radioVal = 'stripe';
                              });
                            },
                          ),
                          Text('stripe'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: _subRadioSelected,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _subRadioSelected = int.parse(value.toString());
                                _radioVal = 'razorpay';
                              });
                            },
                          ),
                          Text('razorpay'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),*/
            ],
          )
        : Container();
  }

  /// payment -01
  _payPalRadioPayment() {
    return InkWell(
      onTap: () {
        print('Click PayPal');
            Get.to(PaypalPayment(onFinish: (){},));
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 50,
        width: 200,
        child: Center(
          child: Text('PayPal', style: ctmPaymentBtnTxtStyle),
        ),
      ),
    );
  }

  /// payment -02
  _payStackRadioPayment() {
    return InkWell(
      onTap: () {
        print('Click Pay Stack ');
        chargeCard();
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 50,
        width: 200,
        child: Center(
          child: Text('PayStack', style: ctmPaymentBtnTxtStyle),
        ),
      ),
    );
  }

  //--------------------- Pay Stack----------------

  //a method to show the message
  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //used to generate a unique reference for payment
  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard() async {
    var charge = Charge()
      ..amount = 10000 * 100
      ..reference = _getReference()
      ..putCustomField('custom_id', '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = 'tutorial@email.com';

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database
      _showMessage('Payment was successful!!!');
    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed!!!');
    }
  }


  //----------------------------------

  /// payment -03
  _stripeRadioPayment() {
    return InkWell(
      onTap: () {
        Get.toNamed('/StripePayment');
        print('Click stripe ');
      },
      child: Container(
          color: Theme.of(context).primaryColor,
          height: 50,
          width: 200,
          child: Center(child: Text('Strip', style: ctmPaymentBtnTxtStyle))),
    );
  }

  //--------------- Stribe payment ------------

  /// payment -04
  _razorPayRadioPayment() {
    return InkWell(
      onTap: () {
        print('Click  Razor Pay ');
        razorPayCheckout();
      },
      child: Container(
          color: Theme.of(context).primaryColor,
          height: 50,
          width: 200,
          child: Center(child: Text('RazorPay', style: ctmPaymentBtnTxtStyle))),
    );
  }

  void razorPayCheckout() async {
    var options = {
      'key': 'rzp_test_nv8ESySdZ6Gaqq',
      'amount': grandTotal.toString(),
      'name': passengerFirstName.toString()+passengerLastName.toString(),
      'description': passengerAddress,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': passengerMobile, 'email': passengerEmail.toString()},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handleRazorPaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleRazorPaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
     Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalRazorWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }


  ///----------------- Part Six  Button Action ---------------------------
  _buildPaymentButtonNavigation() {
   /* if (_radioSelected == 1 && _subRadioSelected == 1) {
      return _payPalRadioPayment();
    } else
  */
      if (_radioSelected == 1 && _subRadioSelected == 2) {
      return _payStackRadioPayment();
    } else if (_radioSelected == 1 && _subRadioSelected == 3) {
      return _stripeRadioPayment();
    } else if (_radioSelected == 1 && _subRadioSelected == 4) {
      return _razorPayRadioPayment();
    } else {
      return Container(
        decoration: ThemeHelper().buttonBoxDecoration(context),
        child: ElevatedButton(
          style: ThemeHelper().buttonStyle(context),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.done_all,
                  size: 30,
                  color: CtmColors.appWhiteColor,
                ),
                SizedBox(
                  width: 10,
                ),
                _radioSelected == 1
                    ? Text(' Make Payment', style: ctmPaymentBtnTxtStyle)
                    : Text('Book your Ticket', style: ctmPaymentBtnTxtStyle)
              ],
            ),
          ),
          onPressed: () {

            if (pickStand == null && dropStand == null) {
             CtmAlertDialog.fieldAlertDialog('Alert', 'Please Select your pick point and drop point');

            } else {
              pr.show();
              bookingPayLaterMapBody = {
                'login_email': passengerEmail,
                'login_mobile': passengerMobile,
                'first_name': passengerFirstName,
                'last_name': passengerLastName,
                'id_type': passengerIdType,
                'country_id': passengerCountryId,
                'id_number': passengerIdNumber,
                'address': passengerAddress,
                'city': passengerCountryCity,
                'zip_code': passengerZipCode,
                'trip_id': tripId,
                'subtripId': subtripId,
                'pick_location_id': pickLocationId,
                'drop_location_id': dropLocationId,
                'pickstand': pickStand,
                'dropstand': dropStand,
                'journeydate': startdate,
                'totalprice': totalPrice.toString(),
                'discount': discount.toString(),
                'pay_method': "1",
                'tax': tax.toString(),
                'grandtotal': grandTotal.toString(),
                'payment_status': _radioSelected == 1 ? 'paid' : 'unpaid',
                'paydetail': 'details',
                'aseat': adultSeat,
                'cseat': childSeat,
                'spseat': specialSeat,
                'vehicle_id': vehicleId,
                'seatnumbers':
                    jsonEncode(widget.bookingInfoBodyMap['seatnumbers']),
                'totalseat': totalSeat,
                'partialpay': '0',
              };

              print('bookingPayLaterMapBody :' + jsonEncode(bookingPayLaterMapBody));

            if (_radioSelected == 1) {
              print("paid  Payment ");

              pr.hide();
              CtmAlertDialog.successAlertDialog('', 'Booking has successful');

            } else {

              print("due Payment ");
              BookingRepository()
                  .creteTicketBookingUnpaidRep(bookingPayLaterMapBody)
                  .then((value) {
                pr.hide();
                CtmAlertDialog.successAlertDialog('', 'Booking has successful');
                Get.offAll(SuccessFulPage());
              }).onError((error, stackTrace) {
                pr.hide();
                CtmAlertDialog.apiServerErrorAlertDialog('Alert', error.toString());
              });
            }
            }
          },
        ),
      );
    }
  }




}
