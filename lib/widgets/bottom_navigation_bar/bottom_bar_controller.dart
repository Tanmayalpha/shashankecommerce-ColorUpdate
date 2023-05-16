import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/view/home/home_view.dart';
import 'package:shashankecommerce/view/portfolio/porfolio_view.dart';
import 'package:shashankecommerce/view/profile/profile_screen.dart';
import 'package:shashankecommerce/view/workshop/workshop_view.dart';

class BottomBarController extends AppBaseController {

  final List<Widget> handlePages = [
    HomeScreen(),
    const PortfolioScreen(),
    WorkshopScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;
  bool isLoading = false;



 void setPageIndex(int i ){
    currentIndex = i;
    update();
  }


}