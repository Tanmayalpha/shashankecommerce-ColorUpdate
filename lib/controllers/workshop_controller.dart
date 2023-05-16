import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/workshop_response.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

import '../utils/colors.dart';

class WorkshopController extends AppBaseController {


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



  void onTapNotification(){
    Get.toNamed(notificationScreen);
  }

  List<WorkshopDataList> workShopList = [] ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWorkshopData();
  }

  Future<void> getWorkshopData() async {

    setBusy(true);
    try {
      Map<String, String> body = {};

      WorkshopDataResponse res = await api.workShopApi(body);
      if (!(res.error ?? true)) {
        workShopList = res.data ?? [] ;
        print('__________${workShopList.first.image}_____________');
        setBusy(false);
        update();

      }

    } catch (e) {
      ShowMessage.showSnackBar('Error True', 'Something went wrong');
    } finally {
      setBusy(false);
      update();
    }
  }

  void onTapCard( int index){
    Get.toNamed(workshopDetailScreen , arguments: workShopList[index]);
  }


}