import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shashankecommerce/controllers/otp_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/view/login/login_view.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/bottom_navigation_bar/bottom_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OtpController(),
      builder: (controller) {
      return Scaffold(
        body: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 110,
                      color:AppColors.green.withOpacity(0.2),

                    ),
                  ),
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 100,
                      color:AppColors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(bottom:30.0,left: 30),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios,color:AppColors.whit,)),
                          ),
                          Text('Verification',style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w500,)),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Text('Code has Send to ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              const SizedBox(height: 5,),
              const Text('+916261253415',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              const SizedBox(height: 5,),
              Text('OTP - ${controller.otp}'),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right:20),
                child: OTPTextField(
                  otpFieldStyle: OtpFieldStyle(backgroundColor:AppColors.textFieldClr,borderColor:AppColors.green),
                  length: 4,
                  keyboardType: TextInputType.number,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 60,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              SizedBox(height: 40,),
              Text('Have not receive the varification code?',style: TextStyle(fontSize:15,fontWeight: FontWeight.w500),),
              TextButton(onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
              }, child:Text('Resend',style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.w500,fontSize: 17),)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:40.0,right:40),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomBar()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        height: 50,
                        decoration:const BoxDecoration(
                          color: AppColors.secondary,
                        ),
                        child:const Center(
                          child: Text("Otp Verify",style: TextStyle(
                              color: AppColors.whit
                          )
                          ),
                        )
                    ),
                  ),
                ),
              )
            ]),
      );
    },);
  }
}
