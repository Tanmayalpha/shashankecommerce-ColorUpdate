import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/app_button.dart';

import '../../controllers/intro_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return GetBuilder(
      init: IntroController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: heightSize,
            width: widthSize,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill),
            ),
            child: controller.disclaimerList.isEmpty ? const Center(child: CircularProgressIndicator(color: AppColors.secondary1),) : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 40.0,
                    top: 300,
                  ),
                  child: Text(
                    'Lorem',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Ipsum, simply.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: Text(
                    controller.disclaimerList.first.title ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                CheckboxListTile(
                  contentPadding: const EdgeInsets.only(left: 40, right: 200),
                  title: Text(
                    'I agree',
                    style: TextStyle(color: Colors.white.withOpacity(.8)),
                  ),
                  value: controller.isChecked,
                  selectedTileColor: Colors.white,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    controller.onTapButton(value ?? false);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppBtn(
                    height: 50,
                    width: 130,
                    title: 'Get Started',
                    onPress: controller.isChecked
                        ? () {
                            controller.onTapGetStarted();
                          }
                        : null,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
