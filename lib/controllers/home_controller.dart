import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/advance_program_response.dart';
import 'package:shashankecommerce/models/home_category_response.dart';
import 'package:shashankecommerce/models/inquiry_response.dart';
import 'package:shashankecommerce/models/program_response.dart';
import 'package:shashankecommerce/models/slider_response.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

import '../models/check_subscription_response.dart';

class HomeController extends AppBaseController {

void onTapNotification(){
  Get.toNamed(notificationScreen);
}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSliderData();
    getHomeCategoryData();
    getAdvanceProgramData();
    checkSubscription();
  }
  RxBool isLoading = false.obs ;

  List <SliderData> sliderList = [] ;
  List <ProgramDataList> categoryList = [] ;
  List <AdvanceProgaramDataList> advanceCategoryList = [] ;


void onTapProgramCard(int index){

Get.toNamed(programDetailScreen, arguments: categoryList[index]);
}

void onTapAdvanceProgramCard(int index){

  Get.toNamed(advanceProgramDetailScreen, arguments: advanceCategoryList[index]);
}


  Future<void> getSliderData () async{
    isLoading.value = true ;
   try{

     SliderResponse res  = await api.sliderApi() ;
     if(!(res.error ?? true)){
       sliderList = res.data ?? [] ;
       isLoading.value = false;
       update();
     }else {
       isLoading.value = false ;
       ShowMessage.showSnackBar('Error',"Something Went Wrong ") ;
     }

   }catch(error) {
     ShowMessage.showSnackBar('Error',"${error}") ;
   }


  }
Future<void> checkSubscription() async {

  setBusy(true);

  SharedPreferences preferences= await SharedPreferences.getInstance();

  String? userId = preferences.getString('user_id');

  try {

    Map<String, String> body = {};
    body[RequestKeys.userId] = userId ?? '216';

    CheckSubscriptionResponse res = await api.checkSubscriptionApi(body);
    if (!(res.error ?? true)) {



     preferences.setString('planType', res.data?.first.type ?? '') ;


      update();

      print('__________${res.message}_____________');


      //setBusy(false);
      //Get.offAllNamed(bottomBar);
      // ShowMessage.showSnackBar('Server Res', res.message ?? '');

    }else{

    }

  } catch (e) {
    ShowMessage.showSnackBar('Server Res', '$e');
  } finally {
    setBusy(false);
    update();
  }
}

  Future<void> getHomeCategoryData() async {

    setBusy(true);
    try {
      Map<String, String> body = {};
      ProgramResponse res = await api.homeCategoryApi(body);
      if (!(res.error ?? true)) {

        categoryList = res.data ?? [] ;
        print('__________${res.message}_____________');
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

Future<void> getAdvanceProgramData() async {

  setBusy(true);
  try {
    Map<String, String> body = {};
    AdvanceProgramResponse res = await api.advanceProgramCategoryApi(body);
    if (!(res.error ?? true)) {

      advanceCategoryList = res.data ?? [] ;
      print('__________${advanceCategoryList.first.image}_____________');
      print('__________${res.message}_____________');
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