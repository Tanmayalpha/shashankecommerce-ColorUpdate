import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/login_response.dart';
import 'package:shashankecommerce/widgets/show_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../route_management/routes.dart';
import '../services/api_services/request_keys.dart';

class LoginController extends AppBaseController{

  TextEditingController mobileController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  int value1 = 0;

  List <LoginUserData> userData = [];



  Future<void> loginUser() async {
    // mobileFocus.unfocus();
    //passwordFocus.unfocus();
    //String? deviceID = await getDeviceIdentifier();
    setBusy(true);
    try {

      Map<String, String> body = {};
      body[RequestKeys.mobile] = mobileController.text.trim();
      body[RequestKeys.password] = passwordController.text.trim();

      LoginUserResponse res = await api.loginUserApi(body);
      print('${res.message}_____gggg_');
      if (!(res.error ?? true)) {

        userData = res.data ?? [] ;
        print('this is id------>${userData[0].id}');
        String? user_id = res.data?[0].id ?? '';
        String? mobile = res.data?[0].mobile ?? '';
        String? email = res.data?[0].email ?? '';
        String? name = res.data?[0].username ?? '';
        print('user id is here=====${user_id}');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_id',user_id);
        prefs.setString('mobile',mobile);
        prefs.setString('email',email);
        prefs.setString('userName',name);



       /// SharedPre.setValue(SharedPre.userData, userData.map((e) => e.toJson()));

        //SharedPre.setValue(SharedPre.userData, userData.toJson());
       /// var obj = await SharedPre.getObjs(SharedPre.userData);
       /// var currentUserData = UserData.fromJson(obj);
      ///  print('__________${currentUserData.id}_____________');
        ShowMessage.showSnackBar('Server Res', res.message ?? '');
        setBusy(false);
        Get.toNamed(bottomBar);
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
      }else{
        ShowMessage.showSnackBar('Server Res', res.message ?? '');
        setBusy(false);
        update();
      }

    } catch (e) {
      ShowMessage.showSnackBar('Server Res', '$e');
    } finally {
      setBusy(false);
      update();
    }
  }

}