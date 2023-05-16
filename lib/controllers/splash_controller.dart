import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/route_management/routes.dart';

class SplashController extends AppBaseController {



  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? isLogin = prefs.getString('user_id');
    print('this is userid====${isLogin}');
    if(isLogin == null){
      Future.delayed( const Duration(seconds: 3),(){
        Get.offNamed(introScreen);
      });

    }else{
      Future.delayed( const Duration(seconds: 3),(){
        Get.offNamed(bottomBar);
      });

    }
    // TODO: implement initState

  }









}