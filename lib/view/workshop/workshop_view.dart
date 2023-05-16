import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/workshop_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/app_network.dart';

class WorkshopScreen extends StatelessWidget {
  WorkshopScreen({Key? key}) : super(key: key);
  List<Map<String, dynamic>> workshop = [
    {
      'image': 'assets/images/Jio vs Airtel 5G Battle Heats Up!.png',
      'title': 'Jio vs Airtel: 5G Battle Heats Up!',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and',
      'time': '8 hours ago',
    },
    {
      'image': 'assets/images/Jio vs Airtel -1.png',
      'title': 'Jio vs Airtel: 5G Battle Heats Up!',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and',
      'time': '8 hours ago',
    },
    {
      'image': 'assets/images/Jio vs Airtel -2.png',
      'title': 'Jio vs Airtel: 5G Battle Heats Up!',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and',
      'time': '8 hours ago',
    },
    {
      'image': 'assets/images/Coke & Pepsi1.png',
      'title': 'Jio vs Airtel: 5G Battle Heats Up!',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and',
      'time': '8 hours ago',
    },
    {
      'image': 'assets/images/Aviation Sectiors Swift Take-Off.png',
      'title': 'Jio vs Airtel: 5G Battle Heats Up!',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and',
      'time': '8 hours ago',
    },
    {
      'image': 'assets/images/Coke & Pepsi New2.png',
      'title': 'Jio vs Airtel: 5G Battle Heats Up!',
      'subtitle':
          'Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and',
      'time': '8 hours ago',
    }
  ];




  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WorkshopController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 140,
                        color: AppColors.green.withOpacity(0.2),
                      ),
                    ),
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 130,
                        color: AppColors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 30.0, left: 30,top: 20),
                              child: GestureDetector(
                                  onTap: () {
                                    //controller.onTapBackforAsk(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.transparent
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'My Work Shop',
                              style: TextStyle(
                                  color: AppColors.whit,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                             InkWell(
                               onTap: () {
                                 //controller.onTapNotification();

                               },
                               child: const Padding(
                                padding: EdgeInsets.only(bottom: 30.0, right: 20,top:20),
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
                controller.isBusy
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondary1,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.workShopList.length,
                        itemBuilder: (context, index) {
                          var item = controller.workShopList[index];
                          return InkWell(
                            onTap: (){
                              controller.onTapCard(index);
                            },
                            child: SizedBox(
                              height: 180,
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 20,
                                      bottom: 20,
                                      child: Card(
                                        elevation: 5,
                                        margin: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 110.0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                right: 20.0),
                                                        child: Text(
                                                          item.title ?? '',
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontSize: 13),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 210,
                                                        child: Divider(
                                                          color: Colors.grey,
                                                          thickness: 0.7,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 5.0),
                                                        child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.9,
                                                            child: Text(
                                                              item.description ??
                                                                  '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 4,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontSize: 10),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 150.0,
                                                                bottom: 10),
                                                        child: Text(
                                                          workshop[index]['time'],
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .secondary,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Positioned(
                                      top: 15,
                                      left: 15,
                                      bottom: 15,
                                      child: Container(
                                        height: 90,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(

                                                image: NetworkImage(
                                                    '${item.image}'),fit: BoxFit.fill)),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
