import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/home_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<Map<String, dynamic>> HomeData = [
    {
      'image': 'assets/images/Group 72395.png',
      'title': 'Easy Options',
      'subtitle': 'Just guess up or down',
    },
  ];

  bool currentIndex = false;

// Exit Function//

  void BackforAsk(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Are you sure you want to exit?."),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.primary),
              child: const Text("YES"),
              onPressed: () {
                exit(0);
                // SystemNavigator.pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.primary),
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10,),
                              Image.asset(
                                'assets/images/Jio vs Airtel 5G Battle Heats Up!.png',
                                height: 80,
                                width: 80,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.onTapNotification();
                                },
                                child: Icon(
                                  Icons.notifications_active_outlined,
                                  color: AppColors.whit,
                                ),
                              ),
                            ],
                          ),
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
                ) :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  carouselSlider(controller, context),
                  controller.isBusy
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondary1,
                    ),
                  )
                      : ListView.builder(
                    itemCount: controller.categoryList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = controller.categoryList[index];
                      return InkWell(
                        onTap: () {
                          controller.onTapProgramCard(index);

                          /*setState(() {
                      currentIndex = !currentIndex;

                    });*/
                        },
                        child: myCard(
                          item.image,
                          item.title,
                          item.shortDescription,
                          currentIndex,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Advance Program',
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  controller.isBusy
                      ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondary1,
                    ),
                  )
                      : ListView.builder(
                    itemCount: controller.advanceCategoryList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = controller.advanceCategoryList[index];
                      return InkWell(
                        onTap: () {
                          controller.onTapAdvanceProgramCard(index);
                          /*setState(() {
                      currentIndex = !currentIndex;

                    });*/
                        },
                        child: myCard(item.image, item.title,
                            item.description, currentIndex),
                      );
                    },
                  ),
                ],)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget carouselSlider(HomeController controller, BuildContext context) {
    return CarouselSlider(
        items: controller.sliderList
            .map((element) => Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 90,
                    width: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(element.image ?? ''),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ))
            .toList(),
        options: CarouselOptions(height: 180, autoPlay: true));
  }
}
