import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/register_user_response.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

import '../services/api_services/request_keys.dart';

class SignupController extends AppBaseController{

   TextEditingController emailController = TextEditingController();
   TextEditingController mobileController = TextEditingController();
   TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cPasswordController = TextEditingController();
    TextEditingController referralController = TextEditingController();


    List<RegisterUserData> registeredData = [] ;

  /* bool _isValidate() {
     if (mobileCtrl.text.isEmpty) {
       ShowMessage.showSnackBar(
         requiredFieldTxt.tr,
         pleaseEnterMobileTxt.tr,
       );
       return false;
     }
     if (passwordCtrl.text.isEmpty) {
       ShowMessage.showSnackBar(
         requiredFieldTxt.tr,
         pleaseEnterPasswordTxt.tr,
       );
       return false;
     }
     return true;
   }*/


   Future<void> registerUser() async {
    // mobileFocus.unfocus();
    //passwordFocus.unfocus();
     //String? deviceID = await getDeviceIdentifier();
     setBusy(true);
     try {

         Map<String, String> body = {};
         body[RequestKeys.mobile] = mobileController.text.trim();
         body[RequestKeys.password] = passwordController.text.trim();
         body[RequestKeys.name] = nameController.text.trim();
         body[RequestKeys.email] = emailController.text.trim();
         if(referralController.text.isNotEmpty) {
        body[RequestKeys.friendsCode] = referralController.text.trim();
          }
      RegisterUserResponse res = await api.registerUserApi(body);
         if (!(res.error ?? true)) {

           registeredData = res.data ?? [] ;
           print('__________${res.message}_____________');
           ShowMessage.showSnackBar('Server Res', res.message ?? '');

           setBusy(false);
           Get.toNamed(loginScreen);
           update();

           //UserData? userData = UserData();
           //userData = res.data;
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
           }else{
           ShowMessage.showSnackBar('Server Res', res.message ?? '');
         }

     } catch (e) {
       ShowMessage.showSnackBar('Server Res', '$e');
     } finally {
       setBusy(false);
       update();
     }
   }

   void tapOnLoginButton(){
     Get.toNamed(loginScreen);
   }
}