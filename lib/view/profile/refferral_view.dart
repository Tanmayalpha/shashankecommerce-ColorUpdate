import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/view/profile/refferel_controller.dart';

import '../../utils/colors.dart';
import '../../widgets/Clip_path.dart';

class RefferralView extends StatefulWidget {
  const RefferralView({Key? key}) : super(key: key);

  @override
  State<RefferralView> createState() => _RefferralViewState();
}

class _RefferralViewState extends State<RefferralView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:RefferelController(),
      builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 130,
                      color: AppColors.green.withOpacity(0.2),
                    ),
                  ),
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 120,
                      color: AppColors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  const [
                          Text(
                            'Refferrel',textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Text('Share & Earn',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
              const SizedBox(height: 20,),
              Image.asset('assets/images/reffernow.jpg'),
              const SizedBox(height: 40,),
              Container(
                height: 60,
                width: 200,
                color: AppColors.primary.withOpacity(0.4),
                child: DottedBorder(
                    child: Center(child: Text('Rs.${controller.amount}',style: TextStyle(color:Colors.red,fontWeight: FontWeight.w500,fontSize: 20),))),
              ),
              SizedBox(height: 40,),
              Container(
                width:MediaQuery.of(context).size.width/1.2,
                child: Text('Earn rs.${controller.amount} for each friend you refer when '
                    'they complete their Registration by refferal code.',style: TextStyle(fontSize:17,fontWeight: FontWeight.w400),),
              ),
          SizedBox(height:40,),
          Container(
            height: 70,
            width: 180,
            child: DottedBorder(
              child:Center(child: Text(controller.referCode,style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.primary,fontSize: 20),)),),
          ),

          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical:40),
                child:GestureDetector(
                  onTap: () {
                  controller.onTapshare();
                  },
                  child: Container(
                      height: 50,
                      width:MediaQuery.of(context).size.width/1.2,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                      ),
                      child: Center(
                        child: controller.isBusy ? const Center(
                          child: CircularProgressIndicator(color: AppColors.whit,),) : const Text("Reffer Now",style: TextStyle(
                            color: AppColors.whit
                        )
                        ),
                      )
                  ),
                ),
              ),
              
              Text('Code must be entered at sign-up',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      );
    },);
  }
}
