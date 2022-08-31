/*
Stripe payment System
*******************************
if(currentCheckout.value.payment.paymentType == 'Stripe'){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => StripePaymentWidget()));
}if(currentCheckout.value.payment.paymentType == 'flutterwave'){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlutterWavePaymentWidget()));
}if(currentCheckout.value.payment.paymentType == 'Paystack'){

Navigator.of(context).push(MaterialPageRoute(builder: (context) => GlobalPaymentWidget(pageTitle: 'Paystack',)));
}


import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:multisuperstore/src/controllers/stripe_controller.dart';
import 'package:multisuperstore/src/repository/order_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webview_flutter/webview_flutter.dart';



// ignore: must_be_immutable
class StripePaymentWidget extends StatefulWidget {

  StripePaymentWidget({Key key, }) : super(key: key);
  @override
  _StripePaymentWidgetState createState() => _StripePaymentWidgetState();
}

class _StripePaymentWidgetState extends StateMVC<StripePaymentWidget> {
  StripeController _con;
  _StripePaymentWidgetState() : super(StripeController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
            color: Theme.of(context).backgroundColor
        ),
        backgroundColor: Colors.transparent,


        elevation: 0,
        centerTitle: true,
        title: Text(
          'Stripe',
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
              initialUrl: _con.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _con.webView = controller;
              },
              onPageStarted: (String url) {
                setState(() {
                  _con.url = url;
                });
                // ignore: deprecated_member_use
                if (url == "${GlobalConfiguration().getString('api_base_url')}Stripe/success") {
                  _con.bookOrder(currentCheckout.value);
                }
              },
              onPageFinished: (String url) {
                setState(() {
                  _con.progress = 1;
                });
              }),
          _con.progress < 1
              ? SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ),
          )
              : SizedBox(),
        ],
      ),
    );
  }
}


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:multisuperstore/src/helpers/helper.dart';
import 'package:multisuperstore/src/models/checkout.dart';
import 'package:multisuperstore/src/repository/order_repository.dart';
import 'package:multisuperstore/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import '../models/address.dart';
import '../repository/user_repository.dart' as userRepo;

class StripeController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  WebViewController webView;
  String url = "";
  double progress = 0;
  Address deliveryAddress;
  OverlayEntry loader;
  StripeController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  @override
  void initState() {
    final String _apiToken = 'api_token=${userRepo.currentUser.value.apiToken}';
    // ignore: deprecated_member_use
    url = '${GlobalConfiguration().getString('api_base_url')}Stripe/index/${userRepo.currentUser.value.id}/${currentCheckout.value.grand_total}?$_apiToken';
    print(url);
    setState(() {});
    super.initState();
  }

  void bookOrder(Checkout order) {
    order.saleCode = '${DateTime.now().millisecondsSinceEpoch}${currentUser.value.id}';




    */
/*

    Overlay.of(context).insert(loader);
    bookOrderResp().then((value) {
      if(order.uploadImage!='no') {
        sendImage(order.uploadImage, value);
      }
      Navigator.of(context).pushNamed('/Thankyou', arguments: value);
    }).catchError((e) {
      // ignore: deprecated_member_use
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(e),
      ));
    }).whenComplete(() {
      Helper.hideLoader(loader);
      //refreshOrders();
      */
/*

    });
  }


  void sendImage(File image, saleCode) async {


    final String _apiToken = 'api_token=${currentUser.value.apiToken}';
    // ignore: deprecated_member_use
    final uri = Uri.parse("${GlobalConfiguration().getString('base_url')}Api/sendimage/${currentUser.value.id}/$saleCode?$_apiToken");
    var request = http.MultipartRequest('POST', uri);
    var pic = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      // Navigator.of(context).pushReplacementNamed('/Success');

    } else {}
  }
}

*************************************
PayPal


import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:multisuperstore/src/repository/order_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/paypal_controller.dart';



// ignore: must_be_immutable
class PayPalPaymentWidget extends StatefulWidget {

  PayPalPaymentWidget({Key key, }) : super(key: key);
  @override
  _PayPalPaymentWidgetState createState() => _PayPalPaymentWidgetState();
}

class _PayPalPaymentWidgetState extends StateMVC<PayPalPaymentWidget> {
  PayPalController _con;

  _PayPalPaymentWidgetState() : super(PayPalController()) {
    _con = controller;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
            color: Theme.of(context).backgroundColor
        ),


        elevation: 0,
        centerTitle: true,
        title: Text(
          'Paypal',
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
              initialUrl: _con.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController controller) {
                _con.webView = controller;
              },
              onPageStarted: (String url) {
                setState(() {
                  _con.url = url;
                });
                // ignore: deprecated_member_use
                if (url == "${GlobalConfiguration().getString('api_base_url')}Paypal/success") {

                  _con.bookOrder(currentCheckout.value);
                }
              },
              onPageFinished: (String url) {
                setState(() {
                  _con.progress = 1;
                });
              }),
          _con.progress < 1
              ? SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ),
          )
              : SizedBox(),
        ],
      ),
    );
  }
}


import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:multisuperstore/src/helpers/helper.dart';
import 'package:multisuperstore/src/models/checkout.dart';
import 'package:multisuperstore/src/repository/order_repository.dart';
import 'package:multisuperstore/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/address.dart';
import '../repository/user_repository.dart' as userRepo;

class PayPalController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  WebViewController webView;
  String url = "";
  double progress = 0;
  Address deliveryAddress;
  OverlayEntry loader;
  PayPalController() {

    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  @override
  void initState() {
    final String _apiToken = 'api_token=${userRepo.currentUser.value.apiToken}';
// ignore: deprecated_member_use
    url = '${GlobalConfiguration().getString('api_base_url')}Paypal/index/${userRepo.currentUser.value.id}/${currentCheckout.value.grand_total}?$_apiToken';
    //   url = 'http://192.168.1.4/map/index.html';
    print(url);
    setState(() {});
    super.initState();
  }


  void bookOrder(Checkout order) {
    order.saleCode = '${DateTime.now().millisecondsSinceEpoch}${currentUser.value.id}';




    */
/* FirebaseFirestore.instance
        .collection('orderDetails')
        .doc(order.saleCode)
        .set({'status': 'Placed', 'userId': currentUser.value.id, 'orderId': order.saleCode, 'shopId': order.shopId,'userName': currentUser.value.name,
      'originLatitude': currentUser.value.latitude, 'originLongitude': currentUser.value.longitude, 'shopLatitude': double.tryParse(currentCheckout.value.shopLatitude),
      'shopLongitude': double.tryParse(currentCheckout.value.shopLongitude),'shopName':currentCheckout.value.shopName}).catchError((e) {
      print(e);
    }); *//*

    Overlay.of(context).insert(loader);
    bookOrderResp().then((value) {
      if(order.uploadImage!='no') {
        sendImage(order.uploadImage, value);
      }
      Navigator.of(context).pushNamed('/Thankyou', arguments: value);
    }).catchError((e) {
      // ignore: deprecated_member_use
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(e),
      ));
    }).whenComplete(() {
      Helper.hideLoader(loader);
      //refreshOrders();
      */
/** scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text(S.of(context).orderThisorderidHasBeenCanceled(order.id)),
          )); *//*

    });
  }


  void sendImage(File image, saleCode) async {


    final String _apiToken = 'api_token=${currentUser.value.apiToken}';
    // ignore: deprecated_member_use
    final uri = Uri.parse("${GlobalConfiguration().getString('base_url')}Api/sendimage/${currentUser.value.id}/$saleCode?$_apiToken");
    var request = http.MultipartRequest('POST', uri);
    var pic = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      // Navigator.of(context).pushReplacementNamed('/Success');

    } else {}
  }





}


*****************************
Razor
if(currentUser.value.paymentType=='RayzorPay'){
_razorpay = Razorpay();
_razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
openCheckout();
}

void openCheckout() async {
  var options = {
    'key': setting.value.razorpay_key,
    'amount': currentCheckout.value.grand_total * 100,
    'name': setting.value.appName,
    'description': 'Online Shopping',
    'prefill': {'contact': currentUser.value.phone, 'email': currentUser.value.email},
    'external': {
      'wallets': ['paytm']
    }
  };

  try {
    _razorpay.open(options);
  } catch (e) {
    // debugPrint(e);
  }
}


paymentGate(){
  print(currentUser.value.paymentType);
  print('payment type${currentCheckout.value.payment.method}');
  print(currentCheckout.value.payment.paymentType);
  paymentProcess();
  if (currentCheckout.value.payment.method == 'online') {
    if(currentUser.value.paymentType=='RayzorPay'){
      _razorpay = Razorpay();
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      openCheckout();
    } if(currentCheckout.value.payment.paymentType == 'Paypal'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayPalPaymentWidget()));
    }if(currentCheckout.value.payment.paymentType == 'Stripe'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => StripePaymentWidget()));
    }if(currentCheckout.value.payment.paymentType == 'flutterwave'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FlutterWavePaymentWidget()));
    }if(currentCheckout.value.payment.paymentType == 'Paystack'){

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GlobalPaymentWidget(pageTitle: 'Paystack',)));
    }if(currentCheckout.value.payment.paymentType == 'wallet'){
      bookOrder(currentCheckout.value);
    } if(currentCheckout.value.payment.paymentType == 'UPI'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentUPI()));
    } if(currentCheckout.value.payment.paymentType == 'mpesa'){

      Mpesa mpesa = Mpesa(
        clientKey: setting.value.mpesaConsumerKey,
        clientSecret: setting.value.mpesaConsumerSecret,
        passKey: setting.value.mpesaPasskey,
        environment: "sandbox",
      );

      mpesa
          .lipaNaMpesa(
        phoneNumber: currentUser.value.phone,
        amount: currentCheckout.value.grand_total,
        businessShortCode: "174379",
        callbackUrl: "https://www.google.co.in/",
      )
          .then((result) {
        bookOrder(currentCheckout.value);
      })
          .catchError((error) {
        showToast('Error', gravity: Toast.BOTTOM,
            duration: Toast.LENGTH_SHORT);
      });
    }
  } else {

    bookOrder(currentCheckout.value);
  }

}


paymentProcess(){


  currentCheckout.value.payment.packingCharge = currentCheckout.value.packingCharge;
  currentCheckout.value.payment.delivery_tips = currentCheckout.value.delivery_tips;
  currentCheckout.value.payment.delivery_fees = currentCheckout.value.delivery_fees;
  currentCheckout.value.payment.sub_total     = currentCheckout.value.sub_total;
  currentCheckout.value.payment.discount      = currentCheckout.value.discount;
  currentCheckout.value.payment.grand_total   = currentCheckout.value.grand_total;

}


void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
  bookOrder(currentCheckout.value);
}

void _handlePaymentError(PaymentFailureResponse response) {
  print("ERROR: " + response.code.toString());
  //Fluttertoast.showToast(msg: "ERROR: " + response.code.toString() + " - " + response.message, timeInSecForIosWeb: 4);
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
}*/
