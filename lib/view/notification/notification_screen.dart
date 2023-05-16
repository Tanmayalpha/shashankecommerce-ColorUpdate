import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/notification_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import '../../widgets/Clip_path.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NotificationController(),
      builder: (controller) {
      return  Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 140,
                    color:AppColors.green.withOpacity(0.2),

                  ),
                ),
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 130,
                    color:AppColors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(bottom:30.0,right:80),
                            child: Icon(Icons.arrow_back_ios,color:AppColors.whit,),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(right: 80.0,bottom: 30),
                          child: Text('Notifications',style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.w500),),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width/1.1,
              child: const Text('A notification is a message that Android displays'
                  ' outside your app''s' 'UI to provide the user with reminders, communication '
                  'from other people, or other timely ...',style: TextStyle(fontWeight: FontWeight.w500),),
            )
          ],
        ),
      );
    },);
  }
}
