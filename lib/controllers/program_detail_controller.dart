import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/advance_program_response.dart';
import 'package:shashankecommerce/models/program_response.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramDetailController extends AppBaseController{

  ProgramDataList ? programData ;


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null) {

      programData = Get.arguments;
    }
  }


  Future<void> launchInBrowser(Uri url) async {
    if (await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

}