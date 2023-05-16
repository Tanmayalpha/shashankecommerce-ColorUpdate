import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/referal_response.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

class RefferelController extends AppBaseController {
String referCode = '';
String amount = '';


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReferalCode();
  }


void onTapRefferal(){
  Get.toNamed(referScreen);

}
Future<void> onTapshare() async {
  await FlutterShare.share(
      title: 'Share',

        text: 'Code: ${referCode}',
      linkUrl: 'https//:images.pexels.com/photos/2825578/pexels-photo-2825578.jpeg?',
      chooserTitle: 'Choose for share'
  );
}

Future<void> getReferalCode() async {
  // mobileFocus.unfocus();
  //passwordFocus.unfocus();
  //String? deviceID = await getDeviceIdentifier();
  setBusy(true);
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String? userId = preferences.getString('user_id');

  try {

    Map<String, String> body = {};
    body[RequestKeys.userId] = userId ?? '';


    ReferalResponse res = await api.getReferalApi(body);
    if (!(res.error ?? true)) {

      referCode = res.data?.referralCode ?? '' ;
      amount = res.data?.amount ?? '' ;

      update();

      ///userData = res.data ?? [] ;

      /// SharedPre.setValue(SharedPre.userData, userData.map((e) => e.toJson()));

      //SharedPre.setValue(SharedPre.userData, userData.toJson());
      /// var obj = await SharedPre.getObjs(SharedPre.userData);
      /// var currentUserData = UserData.fromJson(obj);
      ///  print('__________${currentUserData.id}_____________');
     // ShowMessage.showSnackBar('Server Res', res.message ?? '');
     // setBusy(false);
     // Get.toNamed(loginScreen);
      //update();

      // LoginUserData? userSavedData = LoginUserData();
      // userSavedData = res.data  ;
      //SharedPre.setValue(SharedPre.userData, userData?.toJson());
      //  SharedPre.setValue(SharedPre.isLogin, true);
      /*if (userData?.mobileVerifyStatus == 0) {
             Get.toNamed(AppRoutes.otp,
                 arguments: [mobileCtrl.text.trim(), passwordCtrl.text.trim()]);
           } else if (userData?.profileStatus == 0) {
             Get.offAndToNamed(AppRoutes.setupProfile);
           } else {
             mobileCtrl.clear();
             passwordCtrl.clear();
             Get.offAndToNamed(AppRoutes.home);*/
    }

  } catch (e) {
    ShowMessage.showSnackBar('Server Res', '$e');
    update();

  } finally {
    setBusy(false);
    update();
  }
}






}