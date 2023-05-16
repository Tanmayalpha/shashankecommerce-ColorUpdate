import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/settings_response.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

class PrivacyController extends AppBaseController{
 SettingData? settingData;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSettingsData();
  }

Future<void> getSettingsData() async {

  setBusy(true);
  try {
    Map<String, String> body = {};
    SettingsResponse res = await api.getSettingsApi(body);
    if (!(res.error ?? true)) {

      settingData = res.data ;
      //ShowMessage.showSnackBar('Server Res', res.message ?? '');
      setBusy(false);
      update();

    }

  } catch (e) {
    ShowMessage.showSnackBar('Server Res', '$e');
  } finally {
    setBusy(false);
    update();
  }
}


}