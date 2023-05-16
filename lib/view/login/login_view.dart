
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/login_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/view/forgot_password/forgot_password_view.dart';
import 'package:shashankecommerce/view/otp/otp_view.dart';
import 'package:shashankecommerce/view/signup/signup_view.dart';

import '../../widgets/bottom_navigation_bar/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill,
                  )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*controller.value1 == 0
                            ?*/
                        SizedBox(height: 100,),
                        Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    height:
                                        MediaQuery.of(context).size.height / 1.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: AppColors.fntClr,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 22),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 55.0, right: 55),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: const [
                                                  /*Row(
                                            children: [
                                              Radio(
                                                  value: 0,
                                                  groupValue: controller.value1,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      controller.value1 = value!;
                                                    });
                                                  }),
                                              const Text(
                                                "Email",
                                              ),
                                            ],
                                          ),*/
                                                  /*Row(

                                            children: [
                                              Radio(
                                                  value: 1,
                                                  groupValue: controller.value1,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      controller.value1 = value!;
                                                      // isUpi = true;
                                                    });
                                                  }),
                                              const Text(
                                                "Mobile",
                                              ),
                                            ],
                                          ),*/
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              maxLength: 10,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    controller.mobileController,
                                                decoration: const InputDecoration(
                                                  focusColor: Colors.white,
                                                  counterText: '',
                                                  hintText: "Mobile",
                                                  //add prefix icon
                                                  prefixIcon: Icon(
                                                    Icons.phone,
                                                    color: Colors.grey,
                                                  ),
                                                  // prefixIconConstraints: BoxConstraints(
                                                  //     minWidth: 15,
                                                  //     maxWidth: double.infinity,
                                                  //     maxHeight: 15,minHeight: 15
                                                  // ),
                                                  // contentPadding: EdgeInsets.only(top: 8,left: 20)
                                                )),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            TextFormField(
                                                keyboardType: TextInputType.text,
                                                controller:
                                                    controller.passwordController,
                                                decoration: const InputDecoration(
                                                  focusColor: Colors.white,
                                                  hintText: "Password",
                                                  prefixIcon: Icon(
                                                    Icons.lock_open_outlined,
                                                    color: Colors.grey,
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPasswordScreen()));
                                              },
                                              child: const Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "Forget Password?",
                                                    style: TextStyle(
                                                        color: AppColors.primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 13),
                                                  )),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.loginUser();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors.secondary,
                                                    ),
                                                    child:  Center(
                                                      child: controller.isBusy ? const Center(child: CircularProgressIndicator(color: AppColors.whit,),) : const Text("Login",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .whit)),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            /*: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width: double.infinity,
                                    child: Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            const Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: AppColors.fntClr,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 22),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 55.0, right: 55),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Radio(
                                                          value: 0,
                                                          groupValue:
                                                              controller.value1,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              controller.value1 =
                                                                  value!;
                                                            });
                                                          }),
                                                      const Text(
                                                        "Email",
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                          value: 1,
                                                          groupValue:
                                                              controller.value1,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              controller.value1 =
                                                                  value!;
                                                              // isUpi = true;
                                                            });
                                                          }),
                                                      const Text(
                                                        "Mobile",
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: TextFormField(
                                                  maxLength: 10,
                                                  keyboardType:
                                                      TextInputType.emailAddress,
                                                  controller:
                                                      controller.mobileController,
                                                  decoration:
                                                      const InputDecoration(
                                                    focusColor: Colors.white,
                                                    prefixIcon: Icon(
                                                      Icons.phone,
                                                      color: Colors.grey,
                                                    ),
                                                    counterText: '',
                                                    hintText: "Enter Mobile no.",
                                                    //add prefix icon
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OtpScreen()));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors.secondary,
                                                    ),
                                                    child: const Center(
                                                      child: Text("Send Otp",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .whit)),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),*/
                        ,const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?",
                                style: TextStyle(color: AppColors.whit)),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupScreen()));
                              },
                              child: const Text(
                                "Sign Up Now",
                                style: TextStyle(
                                  color: AppColors.whit,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ))),
        );
      },
    );
  }
}
