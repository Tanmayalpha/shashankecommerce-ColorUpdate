import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/main.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/route_management/screen_bindings.dart';
import 'package:shashankecommerce/view/Privacy/privacy_policy.dart';
import 'package:shashankecommerce/view/forgot_password/forgot_password_view.dart';
import 'package:shashankecommerce/view/home/advance_program_detail/advance_program_detail.dart';
import 'package:shashankecommerce/view/home/program_detail/inquiry_form/inquiry_form_view.dart';
import 'package:shashankecommerce/view/home/program_detail/program_detail_view.dart';
import 'package:shashankecommerce/view/intro/intro_view.dart';
import 'package:shashankecommerce/view/login/login_view.dart';
import 'package:shashankecommerce/view/notification/notification_screen.dart';
import 'package:shashankecommerce/view/otp/otp_view.dart';
import 'package:shashankecommerce/view/portfolio/flagship_portfolio/flagship_portfolio.dart';
import 'package:shashankecommerce/view/portfolio/porfolio_view.dart';
import 'package:shashankecommerce/view/profile/update_profile.dart';
import 'package:shashankecommerce/view/signup/signup_view.dart';
import 'package:shashankecommerce/view/workshop/workshop_detail/workshop_detail_view.dart';
import 'package:shashankecommerce/widgets/bottom_navigation_bar/bottom_bar.dart';

import '../view/profile/refferral_view.dart';
import '../view/profile/wallet/wallet_view.dart';
import '../view/splash/splash_screen.dart';

class AllPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: splashScreen,
          page: () => const SplashScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: loginScreen,
          page: () => const LoginScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: signupScreen,
          page: () =>  SignupScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: bottomBar,
          page: () =>  const BottomBar(),
          binding: ScreenBindings()),
      GetPage(
          name: portfolioScreen,
          page: () =>   const PortfolioScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: forgotPasswordScreen,
          page: () =>   const ForgotPasswordScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: otpScreen,
          page: () =>   const OtpScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: introScreen,
          page: () =>   const IntroScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: updateProfileScreen,
          page: () =>   const UpdateProfile(),),
      GetPage(
        name: flagshipPortfolioScreen,
        page: () =>   const FlagshipPortfolioScreen(),),

      GetPage(
          name:notificationScreen,
          page:()=>const NotificationScreen(),),

      GetPage(
          name:privacypolicyScreen,
          page:()=>PrivacyPolicy()),
      GetPage(
          name:programDetailScreen,
          page:()=>const ProgramDetailScreen()),
      GetPage(
          name:advanceProgramDetailScreen,
          page:()=>const AdvanceProgramDetailScreen()),
      GetPage(
          name:inquiryFormScreen,
          page:()=>const InquiryFormScreen()),
      GetPage(
          name:workshopDetailScreen,
          page:()=>const WorkshopDetailScreen()),
      GetPage(
          name:referScreen,
          page:()=>const RefferralView()),
      GetPage(
          name:walletScreen,
          page:()=>const WalletScreen()),

    ];
  }
}
