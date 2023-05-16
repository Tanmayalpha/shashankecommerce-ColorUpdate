import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/update_profile_controller.dart';

import 'package:shashankecommerce/utils/colors.dart';

import '../../widgets/Clip_path.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UpdateProfileController(),
      builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 260,
                        color:AppColors.green.withOpacity(0.2),
                      ),
                    ),
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 250,
                        color:AppColors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Padding(
                              padding: EdgeInsets.only(bottom:150.0,left: 30),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back_ios,color:AppColors.whit,)),
                            ),
                            const SizedBox(width: 20,),
                            Column(
                              children: [
                                const SizedBox(height: 40,),
                                const Text('Profile',style: TextStyle(color:AppColors.whit,fontWeight: FontWeight.w500,fontSize: 20),),
                                const SizedBox(height: 20,),
                                ClipRRect(child: Image.asset('assets/images/profilepic1.png',height: 70,width: 70,)),
                                const SizedBox(height: 10,),
                                Text(controller.profileController.userName ?? '',style: TextStyle(color: AppColors.whit,fontSize: 20,fontWeight:FontWeight.w600),),
                                const SizedBox(height: 10,),
                                Text('Phone: ${controller.profileController.mobile}',style: TextStyle(color: AppColors.whit,fontSize:10),)
                              ],
                            ),
                            const SizedBox(width: 10,),
                            const Padding(
                              padding: EdgeInsets.only(bottom:150.0,right: 20),
                              child: Icon(Icons.notifications_active_outlined,color: AppColors.whit,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right:250.0),
                  child: Text('Name',style: TextStyle(color: AppColors.green,fontWeight: FontWeight.w500),),
                ),
                const SizedBox(height: 10,),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius:BorderRadius.circular(5) ),
                    child: TextFormField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,color: AppColors.green,),
                        hintText: 'Name',
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right:250.0),
                  child: Text('Email',style: TextStyle(color: AppColors.green,fontWeight: FontWeight.w500),),
                ),
                const SizedBox(height: 10,),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius:BorderRadius.circular(5) ),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email,color: AppColors.green,),
                        hintText: 'Email',
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right:250.0),
                  child: Text('Mobile',style: TextStyle(color: AppColors.green,fontWeight: FontWeight.w500),),
                ),
                const SizedBox(height: 10,),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius:BorderRadius.circular(5) ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone,color: AppColors.green,),
                        counterText: '',
                        hintText: 'Mobile no.',
                      ),
                    )
                ),
                const SizedBox(height:40,),
                GestureDetector(
                  onTap: () {
                    controller.updateUser();
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondary,
                      ),
                      child: Center(
                        child: controller.isBusy ? const Center(child: CircularProgressIndicator(color: AppColors.secondary1,),) : Text("Update",style: TextStyle(
                            color: AppColors.whit
                        )
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
