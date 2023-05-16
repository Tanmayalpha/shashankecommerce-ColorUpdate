import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/disclaimer_response.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

class IntroController extends AppBaseController {


bool isChecked = false ;
List <DisclaimerDataList> disclaimerList = [] ;
  void onTapGetStarted (){

    Get.offNamed(loginScreen);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDisclaimer ();
  }
void onTapButton (bool value) {

  isChecked = value ;
  update();
}



Future <void> getDisclaimer() async{
  setBusy(true);
  try {
    Map<String, String> body = {};
    DisclaimerResponse res = await api.getDisclaimerDataApi(body);
    if (!(res.error ?? true)) {

      disclaimerList = res.data ?? [] ;

      setBusy(false);
      update();

    }else {
      ShowMessage.showSnackBar('Error true', 'Something went wrong');
    }

  } catch (e) {
    ShowMessage.showSnackBar('Server Res', '$e');
  } finally {
    setBusy(false);
    update();
  }


}

}