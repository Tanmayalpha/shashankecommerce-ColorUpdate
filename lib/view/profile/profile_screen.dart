import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/profile_controller.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/utils/colors.dart';

import '../../widgets/Clip_path.dart';
import '../login/login_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 260,
                        color: AppColors.green.withOpacity(0.2),
                      ),
                    ),
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 250,
                        color: AppColors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 150.0, left: 30),
                              child: GestureDetector(
                                  onTap: () {
                                    controller.onTapBackforAsk(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.transparent,
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                const Text(
                                  'Profile',
                                  style: TextStyle(
                                      color: AppColors.whit,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ClipRRect(
                                    child: Image.asset(
                                  'assets/images/profilepic1.png',
                                  height: 70,
                                  width: 70,
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.userName
                                          .toString()
                                          .capitalizeFirst ??
                                      '',
                                  style: TextStyle(
                                      color: AppColors.whit,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Phone: ${controller.mobile}',
                                  style: TextStyle(
                                      color: AppColors.whit, fontSize: 10),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(bottom: 150.0, right: 20),
                              child: Icon(
                                Icons.notifications_active_outlined,
                                color: AppColors.whit,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 190.0),
                  child: Text(
                    'Account Setting',
                    style: TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapUpdateProfile();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.notifications_active_outlined,
                                color: AppColors.green,
                                size: 25,
                              )),
                          SizedBox(width: 20,),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                            const Text(
                            'Update My Profile',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 190.0),
                  child: Text(
                    'Wallet Setting',
                    style: TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapWallet();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: AppColors.green,
                                size: 25,
                              )),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Wallet',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 190.0),
                  child: Text(
                    'General Setting',
                    style: TextStyle(
                        color: AppColors.green, fontWeight: FontWeight.w500),
                  ),
                ),
                /*SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
                    color: AppColors.textFieldClr,
                    borderRadius:BorderRadius.circular(5) ),
                child: Row(
                  children: [
                    Image.asset('assets/images/ClearCacheIcon.png'),
                    SizedBox(width: 20,),
                    Text('Clear Cache',style: TextStyle(fontWeight: FontWeight.w500),),
                    SizedBox(width: 120,),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),*/
                /*const SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
                    color: AppColors.textFieldClr,
                    borderRadius:BorderRadius.circular(5) ),
                child: Row(
                  children: [
                    Image.asset('assets/images/ChangeLanguageicon.png'),
                    const SizedBox(width: 20,),
                    const Text('Change Language',style: TextStyle(fontWeight: FontWeight.w500),),
                    const SizedBox(width: 85,),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),*/
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapWallet();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.help,
                                color: AppColors.green,
                                size: 25,
                              )),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Get Help',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapPrivacyPolicy();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.privacy_tip,
                                color: AppColors.green,
                                size: 25,
                              )),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Privacy Policy',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapRefer();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.error_outline,
                                color: AppColors.green,
                                size: 25,
                              )),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Refer&Earn',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapNotification();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.notifications_active_outlined,
                                color: AppColors.green,
                                size: 25,
                              )),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Notification',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onTapBackforAsk(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldClr,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.green.withOpacity(0.2)),
                              child: Icon(
                                Icons.login_outlined,
                                color: AppColors.green,
                                size: 25,
                              )),
                          /*Image.asset('assets/images/WhatsappIcon.png'),*/
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Logout',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],),

                        const Icon(Icons
                            .arrow_forward_ios) /*Row(
                        children: [
                          Switch.adaptive(
                              activeColor:AppColors.green,
                              value: controller.isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  controller.isSwitched = val;
                                });
                              }),
                        ],
                      )*/
                      ],
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     controller.onTapBackforAsk(context);
                //   },
                //   child: Container(
                //     height: 50,
                //     width: MediaQuery.of(context).size.width / 1.2,
                //     decoration: BoxDecoration(
                //         color: AppColors.textFieldClr,
                //         borderRadius: BorderRadius.circular(5)),
                //     child: Row(
                //       children: [
                //         Image.asset('assets/images/Logout.png'),
                //         const SizedBox(
                //           width: 20,
                //         ),
                //         const Text(
                //           'Logout',
                //           style: TextStyle(fontWeight: FontWeight.w500),
                //         ),
                //         const SizedBox(
                //           width: 155,
                //         ),
                //         const Icon(Icons.arrow_forward_ios)
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
