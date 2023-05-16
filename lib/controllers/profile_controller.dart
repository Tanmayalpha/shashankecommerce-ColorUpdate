import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/route_management/routes.dart';

import '../utils/colors.dart';

class ProfileController extends AppBaseController{
  bool isSwitched = true;

  String? userName;
  String? mobile;

 void onTapUpdateProfile() {

   Get.toNamed(updateProfileScreen);

 }

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  void onTapWallet() {
   Get.toNamed(walletScreen);
  }

  void init() async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   userName = preferences.getString('userName');
   mobile = preferences.getString('mobile');
   if (kDebugMode) {
     print('${userName}____________');
   }
   update();

  }

 void onTapNotification(){

   Get.toNamed(notificationScreen);
 }
 void onTapPrivacyPolicy(){

   Get.toNamed(privacypolicyScreen);
 }

  void onTapRefer(){

    Get.toNamed(referScreen);
  }


  void onTapBackforAsk(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text("Are you sure you want to exit?."),
          actions: <Widget>[
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(primary: AppColors.primary),
              child: const Text("YES"),
              onPressed: () {
                onTapDelete();
               // exit(0);
                // SystemNavigator.pop();
              },
            ),
            ElevatedButton(
              style:
              ElevatedButton.styleFrom(primary: AppColors.primary),
              child: const Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Future<void> onTapDelete() async {
    // Remove the user token from SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('user_id');
    prefs.remove('user_id');
    Get.offAllNamed(loginScreen);

  }
}