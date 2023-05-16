import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/controllers/profile_controller.dart';
import 'package:shashankecommerce/models/update_profile_reponse.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';

import '../widgets/show_message.dart';

class UpdateProfileController extends AppBaseController{


  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final profileController = Get.find<ProfileController>();


  Future<void> updateUser() async {
    // mobileFocus.unfocus();
    //passwordFocus.unfocus();
    //String? deviceID = await getDeviceIdentifier();
    setBusy(true);
    try {

      Map<String, String> body = {};
      body[RequestKeys.userId] = '1';
      body[RequestKeys.userName] = nameController.text;
      body[RequestKeys.email] = emailController.text;

      UpdateUserResponse res = await api.updateUserApi(body);
      if (!(res.error ?? true)) {

        ///userData = res.data ?? [] ;

        /// SharedPre.setValue(SharedPre.userData, userData.map((e) => e.toJson()));

        //SharedPre.setValue(SharedPre.userData, userData.toJson());
        /// var obj = await SharedPre.getObjs(SharedPre.userData);
        /// var currentUserData = UserData.fromJson(obj);
        ///  print('__________${currentUserData.id}_____________');
        ShowMessage.showSnackBar('Server Res', res.message ?? '');
        setBusy(false);
        Get.toNamed(loginScreen);
        update();

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
    } finally {
      setBusy(false);
      update();
    }
  }


 /* void init() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userName = preferences.getString('userName');
    mobile = preferences.getString('mobile');
    print('${userName}____________');
    update();

  }*/


}