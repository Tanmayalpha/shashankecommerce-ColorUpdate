import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/inquiry_response.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';
import 'package:shashankecommerce/widgets/show_message.dart';
import 'package:http/http.dart' as http;

class InquiryFormController extends AppBaseController{
String? programId ;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null) {
      programId = Get.arguments;
    }
  }

final nameController = TextEditingController();
final emailController = TextEditingController();
final mobileController = TextEditingController();




Future<void> getInquiryData() async {
if(nameController.text.isEmpty){
  ShowMessage.showSnackBar('Message', 'Please Enter name');
}else if(emailController.text.isEmpty){
  ShowMessage.showSnackBar('Message', 'Please Enter email');
}else if(mobileController.text.isEmpty){
  ShowMessage.showSnackBar('Message', 'Please Enter mobile');
}else {
      setBusy(true);
      update();
      SharedPreferences preferences= await SharedPreferences.getInstance();
      String? userid = preferences.getString('user_id');


      var headers = {
        'Cookie': 'ci_session=2f98b218ae0f620a44dfba151b42411361d17421'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/shashank_ecommerce/app/v1/api/user_inquiry'));
      request.fields.addAll({
        'user_id': userid ?? '206',
        'name': nameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
        'program_id': programId ?? '',
      });


      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (kDebugMode) {
        print('${request.fields}');
        print('${request.url}');
      }


      print('${response.statusCode}');
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var FinalResult = jsonDecode(result);
        setBusy(false);
        update();
        Get.back();
        ShowMessage.showSnackBar('Server res', '${FinalResult['message']}');

      }
      else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        setBusy(false);
        update();
      }

  /*try {
        Map<String, String> body = {};
        body[RequestKeys.name] = nameController.text;
        body[RequestKeys.email] = emailController.text;
        body[RequestKeys.mobile] = mobileController.text;

        InquiryResponse res = await api.sendInquiryApi(body);
        if (!(res.error ?? true)) {
          ShowMessage.showSnackBar('Server Res', res.message ?? '');
          Get.back();
          setBusy(false);
          update();
        }
      } catch (e) {
        ShowMessage.showSnackBar('Server Res', '$e');
      } finally {
        setBusy(false);
        update();
      }*/
    }
  }


}