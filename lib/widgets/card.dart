  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shashankecommerce/utils/colors.dart';

 Widget myCard(image,text1,text2, bool currentIndex, ){
  return SizedBox(
    height: currentIndex ? 220 : 140,
    child: Stack(
      children: [
        currentIndex ? Positioned(
          top:90 ,
          left:5,
          right: 5,
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10) ), ),
            child: const Padding(
              padding: EdgeInsets.only(left:20.0,right: 20,top:60),
              child: Text('Lorem Ipsum is simply dummy text of the printing and '
                'typesetting industry. Lorem Ipsum has been the industry''s''standard '
                'dummy text ever since the 1500s,',overflow: TextOverflow.ellipsis,maxLines:5,style: TextStyle(fontWeight: FontWeight.w500),),
            ),
          ),
        ) : SizedBox(),
        SizedBox(
          height: 140,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor:const Color(0xff136E5E),
                  child: CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                        child: Text(text1,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      width: 160,
                        child: Text(text2)),
                  ],
                ),
                const Icon(CupertinoIcons.chevron_down,color: Color(0xff828282),)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}