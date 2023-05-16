
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
      return SizedBox(
        height: heightSize,
        width: widthSize,
        child: Image.asset('assets/images/splash.png',fit: BoxFit.fill,),
      );
    },) ;
  }
}



