import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/appbase_controller/appbase_controller.dart';
import 'package:shashankecommerce/models/advance_program_response.dart';
import 'package:shashankecommerce/models/advanced_program_video_response.dart';
import 'package:shashankecommerce/route_management/routes.dart';
import 'package:shashankecommerce/services/api_services/request_keys.dart';
import 'package:shashankecommerce/widgets/show_message.dart';

class AdvanceProgramDetailController extends AppBaseController{


  AdvanceProgaramDataList? advanceProgaramDataList ;

   List <AdvanceProgramVideoData> videoList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null) {
      advanceProgaramDataList = Get.arguments;

      getVideoList(advanceProgaramDataList?.id ?? '1');
    }
  }

 void onTapInquiry(){
    Get.toNamed(inquiryFormScreen, arguments: advanceProgaramDataList?.id);
  }


  Future<void> getVideoList(String id) async{

    setBusy(true);
    update();
    try {
      Map<String, String> body = {};
      body[RequestKeys.programId] = id;
      AdvancedProgramVideoResponse res = await api.getAdvanceVideoApi(body);
      if (!(res.error ?? true)) {

        videoList = res.data ?? [];
        //print('__________${advanceCategoryList.first.image}_____________');
        //print('__________${res.message}_____________');
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