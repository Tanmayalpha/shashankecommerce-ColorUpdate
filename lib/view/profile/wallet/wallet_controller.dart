import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/wallet_response.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';

import '../../../widgets/show_message.dart';

class WalletController extends AppBaseController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletBalance();
  }

String? wallet ;



Future <void> getWalletBalance() async{
// mobileFocus.unfocus();
  //passwordFocus.unfocus();
  //String? deviceID = await getDeviceIdentifier();
  setBusy(true);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('user_id');
  try {

    Map<String, String> body = {};
    body[RequestKeys.userId] = userId ?? '';

    WallteResponse res = await api.getWalletApi(body);
    print('${res.message}_____gggg_');
    if (!(res.error ?? true)) {

       wallet = res.data?.balance ;


      //ShowMessage.showSnackBar('Server Res', res.message ?? '');
      setBusy(false);
      update();


      ShowMessage.showSnackBar('Server Res', res.message ?? '');
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