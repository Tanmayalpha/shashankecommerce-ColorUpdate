import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/workshop_response.dart';

class WorkshopDetailController extends AppBaseController{

  WorkshopDataList? item ;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     if(Get.arguments !=null){
       item = Get.arguments ;
     }
  }
}