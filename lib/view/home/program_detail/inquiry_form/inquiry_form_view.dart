import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shashankecommerce/controllers/inquiry_form_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';

class InquiryFormScreen extends StatelessWidget {
  const InquiryFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: InquiryFormController(),
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 150,
                    color: AppColors.green.withOpacity(0.2),
                  ),
                ),
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 140,
                    color: AppColors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back, color: Colors.white,)),
                        Text(
                          'Inquiry',
                          style: TextStyle(
                              color: AppColors.whit,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        const Icon(Icons.arrow_back, color: Colors.transparent,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250.0),
              child: Text(
                'Name',
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
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.green,
                    ),
                    hintText: 'Name',
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250.0),
              child: Text(
                'Email',
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
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.green,
                    ),
                    hintText: 'Email',
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250.0),
              child: Text(
                'Mobile',
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
                  controller: controller.mobileController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: AppColors.green,
                    ),
                    counterText: '',
                    hintText: 'Mobile no.',
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 50),
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    controller.getInquiryData();
                  },
                  child: controller.isBusy ? const Center(child: CircularProgressIndicator(color: AppColors.secondary1,),)  : const Text('Get Inquiry')),
            ),
          ],
        ),
      ),
    );
  }
}
