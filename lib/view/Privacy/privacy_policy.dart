import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/privacy_controller.dart';

import '../../utils/colors.dart';
import '../../widgets/Clip_path.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:PrivacyController(),
      builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child:  Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 140,
                      color:AppColors.green.withOpacity(0.2),

                    ),
                  ),
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 130,
                      color:AppColors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(bottom:30.0,right:80),
                              child: Icon(Icons.arrow_back_ios,color:AppColors.whit,),
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(right: 80.0,bottom: 30),
                            child: Text('Privacy Policy',style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w500),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              controller.settingData == null ? const Center(child: CircularProgressIndicator(color: AppColors.secondary1,),) :Column(children: [
                Html(
                  data: controller.settingData?.privacyPolicy?.first,
                  style: {
                    '#': Style(fontSize: FontSize(16), maxLines: 20, )
                  },

                ),
                Html(
                  data: controller.settingData?.contactUs?.first,
                  style: {
                    '#': Style(fontSize: FontSize(16), maxLines: 20, )
                  },

                )
              ],)
            ],
          ),
        ),
      );
    },);
  }
}

