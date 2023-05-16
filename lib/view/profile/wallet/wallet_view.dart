import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/view/profile/wallet/wallet_controller.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WalletController(),
      builder: (controller) =>
          Scaffold(
            body: Column(children: [
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
                      height: 130,
                      color: AppColors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 30.0, right: 80),
                              child: Icon(
                                Icons.arrow_back_ios, color: AppColors.whit,),
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(right: 80.0, bottom: 30),
                            child: Text('Wallet', style: TextStyle(fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: const Text(
                      'My Wallet',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Balance',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              children: [
                                const Icon(Icons.account_balance_wallet,
                                  color: AppColors.primary,),
                                const SizedBox(width: 8.0),
                                Text(
                                  '\$${controller.wallet ?? '---'}',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[800],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],),
          ),);
  }
}
