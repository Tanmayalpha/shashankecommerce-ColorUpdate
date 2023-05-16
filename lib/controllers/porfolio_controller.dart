import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/portfolio_response.dart';
import 'package:shashankecommerce/view/portfolio/porfolio_view.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

import '../models/subscription_plan_resoponse.dart';
import '../route_management/routes.dart';
import '../utils/colors.dart';

class PortfolioController extends AppBaseController{


  void onTapNotification(){
    Get.toNamed(notificationScreen);
  }


  void onTapBackforAsk(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Are you sure you want to exit?."),
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
      },
    );
  }

  List <PortfolioData> portfolioList = [] ;

  List<SubscriptionPlanData> subscriptionDataList = [];

  String? userName ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPortfolioData();
    init();
    //getSubscriptionData();
  }

 void init() async{

    SharedPreferences preferences = await SharedPreferences.getInstance() ;

    userName = preferences.getString('userName');

 }


  Future<void> getPortfolioData() async {
    setBusy(true);
    try {
      Map<String, String> body = {};
      PortfolioResponse res = await api.getPortfolioDataApi(body);
      if (!(res.error ?? true)) {

        portfolioList = res.data ?? [] ;
        print('__________${portfolioList.first.description}_____________');

        setBusy(false);
        update();

      }else {
        ShowMessage.showSnackBar('Error true', 'Something went wrong');
      }

    } catch (e) {
      ShowMessage.showSnackBar('Server Res', '$e');
    } finally {
      setBusy(false);
      update();
    }
  }

/*  Future<void> getSubscriptionData() async {
    setBusy(true);
    try {
      Map<String, String> body = {};
      SubscriptionPlanResponse res = await api.getSubscriptionDataApi(body);
      if (!(res.error ?? true)) {

        subscriptionDataList = res.data ?? [] ;
        //print('__________${portfolioList.first.description}_____________');

        setBusy(false);
        update();

      }else {
        ShowMessage.showSnackBar('Error true', 'Something went wrong');
      }

    } catch (e) {
      ShowMessage.showSnackBar('Server Res', '$e');
    } finally {
      setBusy(false);
      update();
    }
  }*/

 void onTapSubscribeButton (PortfolioData item){

    Get.toNamed(flagshipPortfolioScreen, arguments: item);

  }


}