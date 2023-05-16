import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/check_subscription_response.dart';
import 'package:shashankecommerce/models/portfolio_response.dart';
import 'package:shashankecommerce/models/purches_subscription_response.dart';
import 'package:shashankecommerce/models/subscription_plan_resoponse.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';

import '../widgets/show_message.dart';

class FlagshipPortfolioController extends AppBaseController {


  PortfolioData? item ;
  late Razorpay _razorpay;

  bool isSubscribed = false ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments!=null) {
      item = Get.arguments;
    }
    checkSubscription();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> getSubscription() async {

    setBusy(true);

    SharedPreferences preferences= await SharedPreferences.getInstance();

    String? userId = preferences.getString('user_id');

    try {

      Map<String, String> body = {};
      body[RequestKeys.userId] = userId ?? '216';
      body[RequestKeys.planType] = item?.planType ??'';
      body[RequestKeys.portfolioId] = item?.id ?? '';

      SubscribePlanResponse res = await api.getSubscriptionApi(body);
      if (!(res.error ?? true)) {

        print('__________${res.message}_____________');


        setBusy(false);
        Get.offAllNamed(bottomBar);
        ShowMessage.showSnackBar('Server Res', res.message ?? '');

      }

    } catch (e) {
      ShowMessage.showSnackBar('Server Res', '$e');
    } finally {
      setBusy(false);
      update();
    }
  }

  String? pricerazorpayy;



  Future<void> checkSubscription() async {

    setBusy(true);

    SharedPreferences preferences= await SharedPreferences.getInstance();

    String? userId = preferences.getString('user_id');

    try {

      Map<String, String> body = {};
      body[RequestKeys.userId] = userId ?? '216';
      body[RequestKeys.portfolioId] = item?.id ?? '';

      CheckSubscriptionResponse res = await api.checkSubscriptionApi(body);
      if (!(res.error ?? true)) {

        isSubscribed = true;
        update();

        print('__________${res.message}_____________');


        //setBusy(false);
        //Get.offAllNamed(bottomBar);
       // ShowMessage.showSnackBar('Server Res', res.message ?? '');

      }

    } catch (e) {
      ShowMessage.showSnackBar('Server Res', '$e');
    } finally {
      setBusy(false);
      update();
    }
  }

  void openCheckout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userMobile = prefs.getString('mobile');
    String? userEmail = prefs.getString('email');

    int price = int.parse(item?.price ?? '');


    // if(totalValue == null || totalValue == ""){
    //   pricerazorpayy= cartModel!.getCartList!.total! * 100;
    // }
    // else{
    //   pricerazorpayy= int.parse(totalValue.toString()) * 100;
    // }
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': price*100,
      'name': 'Assignment-assist',
      'description': 'Assignment-assist',
      'prefill': {'contact': '$userMobile', 'email': '$userEmail'},
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

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // RazorpayDetailApi();
    // Order_cash_ondelivery();

    getSubscription();
    Fluttertoast.showToast(
        msg: "Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
    Fluttertoast.showToast(
        msg: "Payment cancelled by user",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }






}