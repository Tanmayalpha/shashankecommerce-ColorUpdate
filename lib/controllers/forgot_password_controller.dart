import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/reset_password.dart';
import 'package:shashankecommerce/route_management/routes.dart';

import '../services/api_services/request_keys.dart';
import '../widgets/show_message.dart';

class ForGotPasswordController extends AppBaseController {


  TextEditingController mobileController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  int value1 = 0;

  ResetPasswordResponse? userData;

  Future<void>Resetpassword() async {
    setBusy(true);
    try {

      Map<String, String> body = {};
      body[RequestKeys.mobile_no] = mobileController.text.trim();
      body[RequestKeys.newPassword] = newpassController.text.trim();

      ResetPasswordResponse res = await api.resetPasswordApi(body);
      if (!(res.error ?? true)) {
        String?   userData =res.message ;
        print('this is message------>${userData}');

        ShowMessage.showSnackBar('Server Res', res.message ?? '');
        setBusy(false);
        Get.toNamed(loginScreen);
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