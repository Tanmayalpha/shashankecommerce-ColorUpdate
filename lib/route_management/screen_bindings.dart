import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/splash_controller.dart';
import 'package:shashankecommerce/view/forgot_password/forgot_password_view.dart';
import 'package:shashankecommerce/view/intro/intro_view.dart';
import 'package:shashankecommerce/view/login/login_view.dart';
import 'package:shashankecommerce/view/otp/otp_view.dart';
import 'package:shashankecommerce/view/portfolio/porfolio_view.dart';
import 'package:shashankecommerce/view/signup/signup_view.dart';
import 'package:shashankecommerce/widgets/bottom_navigation_bar/bottom_bar.dart';

class ScreenBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => SplashController() );
    Get.lazyPut(() => const LoginScreen() );
    Get.lazyPut(() =>  SignupScreen() );
    Get.lazyPut(() =>  const BottomBar() );
    Get.lazyPut(() =>  const OtpScreen() );
    Get.lazyPut(() =>  const ForgotPasswordScreen() );
    Get.lazyPut(() =>  const PortfolioScreen() );
    Get.lazyPut(() =>  const IntroScreen() );


  }


}