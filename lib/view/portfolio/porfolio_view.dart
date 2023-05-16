import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/porfolio_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/portfoliocard.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PortfolioController(),
      builder: (controller) {
        return Scaffold(
            body: ListView(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 110,
                        color: AppColors.green.withOpacity(0.2),
                      ),
                    ),
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
                        height: 100,
                        color: AppColors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            InkWell(
                              onTap: () {
                               controller.onTapBackforAsk(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.whit,
                              ),
                            ),

                            const Text(
                              'Portfolio',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),

                             InkWell(
                               onTap: () {
                                 //controller.onTapNotification();
                               },
                               child: const Padding(
                                padding: EdgeInsets.only(bottom: 30.0, right: 20),
                                child: Icon(
                                  Icons.notifications_active_outlined,
                                  color: Colors.transparent,
                                ),
                            ),
                             ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children:  [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                              AssetImage("assets/images/Group 72375.png"),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Hi, ",
                              style: TextStyle(fontSize: 20),
                            ),
                            controller.userName == null ? Text('') :Text(
                              controller.userName.toString().capitalizeFirst ?? '',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      controller.isBusy
                          ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondary1,
                        ),
                      )
                          : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.portfolioList.length,
                        itemBuilder: (context, index) {
                          var item = controller.portfolioList[index];
                          return MyPortCard(
                              item.plan ?? '',
                              item.shortDescription ?? '',
                              item.image ?? '',
                              context,
                              controller,
                              item.price ?? '',
                              item.planType ?? '', () {
                            controller.onTapSubscribeButton(item);
                          });
                        },
                      )
                    ],),
                )
              ],
            ));
      },
    );
  }
}
