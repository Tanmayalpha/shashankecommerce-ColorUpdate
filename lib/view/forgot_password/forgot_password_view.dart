import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/forgot_password_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForGotPasswordController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Column(
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
                        height: 100,
                        color: AppColors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 30.0, left: 30),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.whit,
                              ),
                            ),

                            Text(
                              'Forget Password',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220.0),
                  child: Text(
                    'Login Mobile no',
                    style: TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller:
                      controller.mobileController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,

                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.green,
                        ),
                        hintText: 'Enter Mobile no',
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220.0),
                  child: Text(
                    'New Password',
                    style: TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: controller.newpassController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.green,
                        ),
                        hintText: 'Enter new password',
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220.0),
                  child: Text(
                    'Verify password',
                    style: TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: AppColors.green,
                        ),
                        counterText: '',
                        hintText: 'Confirm password',
                      ),
                    )),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    controller.Resetpassword();
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondary,
                      ),
                      child: const Center(
                        child: Text("Change Password",
                            style: TextStyle(color: AppColors.whit)),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
