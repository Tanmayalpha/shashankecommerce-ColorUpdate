import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/signup_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/bottom_navigation_bar/bottom_bar.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignupController(),
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.whit,
                                  borderRadius: BorderRadius.circular(20)),
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
                                            "Sign Up",
                                            style: TextStyle(
                                                color: AppColors.fntClr,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 22),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return "name is required";
                                            }
                                          },
                                          keyboardType: TextInputType.text,
                                          controller: controller.nameController,
                                          decoration: const InputDecoration(
                                              focusColor: Colors.white,
                                              hintText: "Name",
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                              ),
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 15,
                                                      maxWidth: double.infinity,
                                                      maxHeight: 15,
                                                      minHeight: 15),
                                              contentPadding: EdgeInsets.only(
                                                  top: 8, left: 10))),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                          validator: (v) {
                                            if (!v!.contains('@')) {
                                              return "Email is required";
                                            }
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller:
                                              controller.emailController,
                                          decoration: const InputDecoration(
                                              focusColor: Colors.white,
                                              hintText: "Email",
                                              //add prefix icon
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: Colors.grey,
                                              ),
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 15,
                                                      maxWidth: double.infinity,
                                                      maxHeight: 15,
                                                      minHeight: 15),
                                              contentPadding: EdgeInsets.only(
                                                  top: 8, left: 10))),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                          keyboardType: TextInputType.number,
                                          maxLength: 10,
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return "Mobile is required";
                                            }
                                          },
                                          controller:
                                              controller.mobileController,
                                          decoration: const InputDecoration(
                                              counterText: "",
                                              focusColor: Colors.white,
                                              hintText: " Mobile",
                                              prefixIcon: Icon(
                                                Icons.phone,
                                                color: Colors.grey,
                                              ),
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 15,
                                                      maxWidth: double.infinity,
                                                      maxHeight: 15,
                                                      minHeight: 15),
                                              contentPadding: EdgeInsets.only(
                                                  top: 8, left: 10))),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                          obscureText: true,
                                          validator: (v) {
                                            if (v!.isEmpty) {
                                              return "Password is required";
                                            }
                                          },
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
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 15,
                                                      maxWidth: double.infinity,
                                                      maxHeight: 15,
                                                      minHeight: 15),
                                              contentPadding: EdgeInsets.only(
                                                  top: 8, left: 10))),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller:
                                              controller.cPasswordController,
                                          validator: (v) {
                                            if (v!.isEmpty ||
                                                v !=
                                                    controller
                                                        .passwordController.text
                                                        .trim()) {
                                              return "Password does not match";
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              focusColor: Colors.white,
                                              hintText: " Confirm Password",
                                              prefixIcon: Icon(
                                                Icons.lock_open_outlined,
                                                color: Colors.grey,
                                              ),
                                              prefixIconConstraints:
                                                  BoxConstraints(
                                                      minWidth: 15,
                                                      maxWidth: double.infinity,
                                                      maxHeight: 15,
                                                      minHeight: 15),
                                              contentPadding: EdgeInsets.only(
                                                  top: 8, left: 10))),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      controller.referralController.text.isEmpty
                                          ? InkWell(
                                              onTap: () {
                                                referralCode(
                                                    context, controller);
                                              },
                                              child: const Text(
                                                'Do you have any referral? click here',
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ))
                                          : InkWell(
                                        onTap: (){
                                          referralCode(
                                              context, controller);
                                        },
                                            child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(border: Border.all(color: AppColors.primary)),
                                              child: Text(
                                                  controller
                                                      .referralController.text.toString().toUpperCase(),
                                                  style: const TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                            ),
                                          ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              controller.registerUser();
                                            }
                                          },
                                          child: Container(
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                color: AppColors.secondary,
                                              ),
                                              child: Center(
                                                child: controller.isBusy
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: AppColors.whit,
                                                        ),
                                                      )
                                                    : const Text("Sign Up",
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?",
                                style: TextStyle(color: AppColors.whit)),
                            const SizedBox(
                              width: 2,
                            ),
                            InkWell(
                              onTap: () {
                                controller.tapOnLoginButton();
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.whit,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))),
        );
      },
    );
  }

  referralCode(
    BuildContext context,
    SignupController controller,
  ) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Enter Referral Code'),
              content: TextFormField(
                controller: controller.referralController,
                decoration: const InputDecoration(hintText: 'Referral Code'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    String referralCode = controller.referralController.text;
                    // Do something with referralCode
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ],
            ));
  }
}
