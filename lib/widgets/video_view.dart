import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key, required this.videoUrl, this.isPaid, this.price})
      : super(key: key);
  final String videoUrl;

  final bool? isPaid;
  final  String? price;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;

  bool? isPlaying;

  bool isPaymentSuccess = false ;

  late Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${widget.videoUrl}');
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((value) {
      return videoPlayerController.pause();
    }).catchError((onError) {
      print('Error initializing video player: $onError');
    });

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.hasError) {
        print(
            'Error playing video: ${videoPlayerController.value.errorDescription}');
      }
    });
    //videoPlayerController.initialize();
    //videoPlayerController.setLooping(false);
    //videoPlayerController.play();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
// height: 180,
// width: MediaQuery.of(context).size.width,
        child: /*typeString == "jpg"
            ? ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.network(
                widget.videoUrl,
                fit: BoxFit.fill,
              ),
            )
            :*/
            Stack(
          fit: StackFit.expand,
          children: [
            AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: InkWell(
                    onTap: () async{
                      if (videoPlayerController.value.isPlaying) {
                        videoPlayerController.pause();
                        isPlaying = false;
                      } else {
                        //print("____fff___${isPaymentSuccess}_______");
                       // print("_______${widget.isPaid}_______");
                        SharedPreferences preferences= await SharedPreferences.getInstance();

                        String? type = preferences.getString('planType');


                        if ((widget.isPaid ?? false) && (!isPaymentSuccess)&& (type == 'Pro' || type==null)) {

                          Get.defaultDialog(
                              middleText:
                                  "Before you play this video, You will have to pay ₹${widget.price} ",
                              confirm: ElevatedButton(
                                  onPressed: () {
                                    openCheckout();
                                  },
                                  child: Text('Pay'),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                              ));
                        } else {
                          isPlaying = true;
                          videoPlayerController.play();
                        }
                      }
                      setState(() {});
                    },
                    child: Icon(
                        isPlaying ?? false ? Icons.pause : Icons.play_arrow,
                        color: Colors.white)))
          ],
        ));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoPlayerController?.dispose();
  }


  void openCheckout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userMobile = prefs.getString('mobile');
    String? userEmail = prefs.getString('email');

    int price = int.parse(widget.price?? '');


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
    isPaymentSuccess = true;
    Fluttertoast.showToast(
        msg: "Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    Get.back();
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
