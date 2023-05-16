import 'package:flutter/material.dart';
import 'package:shashankecommerce/controllers/porfolio_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/view/home/home_view.dart';

MyPortCard(String title, String text, String image, BuildContext context,
    PortfolioController controller, String price, String type, VoidCallback onTap) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0, right: 50),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.61,
                        child: Text(
                          text,
                          style: const TextStyle(fontSize: 12),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text("TYPE"),
                              Text(
                                type,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 0,
                            endIndent: 20,
                          ),
                          Column(
                            children: [
                              const Text("PRICE"),
                              Text(
                                "\u20B9 ${price}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: const Text("Subscribe"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          top: -5,
          right: 7,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 60,
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('${image}'),
            ),
          ))
    ],
  );
}
