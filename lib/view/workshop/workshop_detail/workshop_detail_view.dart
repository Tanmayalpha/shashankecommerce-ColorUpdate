/*class WorkshopDetailScreen extends StatelessWidget {
  const WorkshopDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/view/workshop/workshop_detail/workshop_detai_controller.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/video_view.dart';

class WorkshopDetailScreen extends StatelessWidget {
  const WorkshopDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WorkshopDetailController(),
      builder: (controller) => Scaffold(
        body: Column(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 130,
                    color: AppColors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back, color: Colors.white,)),
                        const Text(
                          'Workshop Detail',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const Icon(Icons.arrow_back, color: Colors.transparent,),
                        /*InkWell(
                      onTap: () {
                        //controller.onTapNotification();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 130.0),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: AppColors.whit,
                        ),
                      ),
                    ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.center,
                child: Image.network(controller.item?.image ?? '')),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                controller.item?.title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                controller.item?.description ?? '',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 180,
                width: controller.getWidth(context),
                child:
                VideoView(videoUrl: controller.item?.video ?? '', isPaid: true, price: controller.item?.price ?? '',)),
            const SizedBox(
              height: 10,
            ),
            /*const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Download PFD',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: (){controller.launchInBrowser(Uri.parse(controller.programData?.pdf ?? ''));},
              child: Container(
                width: controller.getWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  controller.programData?.pdf ?? '',
                  style: const TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
