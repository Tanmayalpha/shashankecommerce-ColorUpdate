import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/video_view.dart';

import 'advance_program_detail_controller.dart';

class AdvanceProgramDetailScreen extends StatelessWidget {
  const AdvanceProgramDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AdvanceProgramDetailController(),
      builder: (controller) => Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50),
                  backgroundColor: AppColors.primary),
              onPressed: () {
                controller.onTapInquiry();
              },
              child: const Text('Get Inquiry')),
        ),
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
                            'Advance Program Detail',
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
                child: Image.network(
                    controller.advanceProgaramDataList?.image ?? ''),
              ),
              const SizedBox(height: 16),
               Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  controller.advanceProgaramDataList?.title ?? '',
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
                  controller.advanceProgaramDataList?.description ?? '',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20,),
              controller.isBusy ? const Center(child: SingleChildScrollView(),)  :
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.videoList.length,
                itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(controller.videoList[index].title ?? '', style:  const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18 ),),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 180,
                      width: controller.getWidth(context),
                      child:
                      VideoView(videoUrl: controller.videoList[index].video ?? '')),
                    const SizedBox(height: 30,)
                ],);
              },),

              const SizedBox(
                height: 80,
              ),


              /*Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  width: controller.getWidth(context),
                  child:  VideoView(videoUrl: video)),*/
            ],
          ),
        ),
      ),
    );
  }
}
