/*
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/view/home/home_view.dart';
import 'package:shashankecommerce/view/portfolio/porfolio_view.dart';
import 'package:shashankecommerce/view/profile/profile_screen.dart';
import 'package:shashankecommerce/view/workshop/workshop_view.dart';

import 'bottom_bar_controller.dart';


class BottomBar extends StatefulWidget {

  const BottomBar({Key? key,}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

 Widget _getBottomNavigator(BottomBarController controller) {
    return Material(

      // color: AppColor().colorTextwhit(),
      //elevation: 2,
      child: CurvedNavigationBar(
        color: AppColors.primary,
        index: controller.currentIndex,
        height: 50,
        buttonBackgroundColor:AppColors.whit,
        backgroundColor:AppColors.whit,

        items: <Widget>[
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('assets/images/homeIcon.png',height:25,width:25,
                color: controller.currentIndex == 0 ? AppColors.primary : AppColors.whit,
              )
          ),

          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('assets/images/portfolioIcon.png',height: 30,width:30,
                color: controller.currentIndex == 1 ? AppColors.primary :AppColors.whit,
              )
          ),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child:Image.asset('assets/images/bagIcon.png',height:25,width:25,
                color: controller.currentIndex == 2 ? AppColors.primary :AppColors.whit,
              )
          ),

          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/images/personIcon.png',height:25,width:25,
              // _currentIndex == 3 ?,
              // : Icons.person_3_outlined,
              color: controller.currentIndex == 3 ?AppColors.primary :AppColors.whit,
            ),
          ),

        ],
        onTap: (index) {
          if (kDebugMode) {
            print("current index here ${index}");
          }
         controller.setPageIndex(index);

        },
      ),
    );
  }




  @override
  Widget build(BuildContext context) {


    return
      WillPopScope(
          onWillPop: () async {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Exit"),
                    content: const Text("Are you sure you want to exit?"),
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:AppColors.primary
                        ),
                        child: const Text("YES"),
                        onPressed: () {

                          exit(0);
                          // SystemNavigator.pop();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:AppColors.primary
                        ),
                        child: Text("NO"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                }
            );
            return true;
          },
          child: GetBuilder(
            init: BottomBarController(),
            builder: (controller) {
            return Builder(
              builder: (context) {
                return Scaffold(
                    body:
                    controller.handlePages[controller.currentIndex],
                    bottomNavigationBar: _getBottomNavigator(controller)
                );
              }
            );
          },)
      );
  }
}*/

import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/utils/colors.dart';

import 'package:shashankecommerce/widgets/bottom_navigation_bar/bottom_bar_controller.dart';

import '../../view/home/home_view.dart';
import '../../view/portfolio/porfolio_view.dart';

class BottomBar extends StatefulWidget {
  final int? index;
  final String? groupJoined;

  const BottomBar({Key? key, this.index, this.groupJoined}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  var _selBottom = 0;

  //String? bookID;

  bool isLoading = false;

  Widget _getBottomNavigator(BottomBarController controller) {
    return Material(
      // color: AppColor().colorTextwhit(),
      //elevation: 2,
      child: CurvedNavigationBar(
        color: AppColors.primary,
        index: controller.currentIndex,
        height: 50,
        buttonBackgroundColor: AppColors.whit,
        backgroundColor: AppColors.whit,
        items: <Widget>[
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/images/homeIcon.png',
                height: 25,
                width: 25,
                color: controller.currentIndex == 0
                    ? AppColors.primary
                    : AppColors.whit,
              )),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/images/portfolioIcon.png',
                height: 30,
                width: 30,
                color: controller.currentIndex == 1
                    ? AppColors.primary
                    : AppColors.whit,
              )),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/images/bagIcon.png',
                height: 25,
                width: 25,
                color: controller.currentIndex == 2
                    ? AppColors.primary
                    : AppColors.whit,
              )),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/personIcon.png', height: 25, width: 25,
              // _currentIndex == 3 ?,
              // : Icons.person_3_outlined,
              color: controller.currentIndex == 3
                  ? AppColors.primary
                  : AppColors.whit,
            ),
          ),
        ],
        onTap: (index) {
          print("current index here ${index}");
          setState(() {
            controller.currentIndex = index;
            //_selBottom = _currentIndex;
            print("sel bottom ${_selBottom}");
            //_pageController.jumpToPage(index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm Exit"),
                  content: const Text("Are you sure you want to exit?"),
                  actions: <Widget>[
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: AppColors.primary),
                      child: const Text("YES"),
                      onPressed: () {
                        exit(0);
                        // SystemNavigator.pop();
                      },
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: AppColors.primary),
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
          return true;
        },
        child: GetBuilder(
          init: BottomBarController(),
          builder: (controller) => Scaffold(
              key: scaffoldKey,
              body: controller.handlePages[controller.currentIndex],
              bottomNavigationBar: _getBottomNavigator(controller)),
        )
    );
  }
}
