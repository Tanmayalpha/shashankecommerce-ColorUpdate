import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shashankecommerce/controllers/flagship_portfolio_controller.dart';
import 'package:shashankecommerce/utils/colors.dart';
import 'package:shashankecommerce/widgets/Clip_path.dart';
import 'package:shashankecommerce/widgets/video_view.dart';

class FlagshipPortfolioScreen extends StatefulWidget {
  const FlagshipPortfolioScreen({Key? key}) : super(key: key);

  @override
  State<FlagshipPortfolioScreen> createState() =>
      _FlagshipPortfolioScreenState();
}

class _FlagshipPortfolioScreenState extends State<FlagshipPortfolioScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FlagshipPortfolioController(),
      builder: (controller) {
        print('${controller.isSubscribed}');
        return SafeArea(
          child: Scaffold(
            bottomSheet: controller.isSubscribed ? SizedBox()  : InkWell(
              onTap: (){
                controller.openCheckout();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                          "Subscribe Now",
                          style: TextStyle(color: AppColors.whit),
                        ))),
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 110,
                        color: AppColors.green.withOpacity(0.2),
                      ),
                    ),
                    ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                        alignment: Alignment.topCenter,
                        height: 100,
                        color: AppColors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                            const Text(
                              'Flagship Portfolio',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            const Icon(Icons.arrow_back, color: Colors.transparent,),
                            /*InkWell(
                      onTap: () {
                        //controller.onTapNotification();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 130.0),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: AppColors.whit,
                        ),
                      ),
                    ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TabBar(
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Feature'),
                        Tab(text: 'Performance'),
                        Tab(text: 'Stocks'),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .70,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // First tab view
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(controller.item?.featured?.first
                                        .featuredDescription ??
                                    'dffsdf'),
                                const SizedBox(height: 20,),
                                Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    height: 250,
                                    width: controller.getWidth(context),
                                    child:
                                    VideoView(videoUrl: controller.item?.video ?? '',)),
                              ],
                            ),
                          ),

                          // Second tab view
                          Image.network(controller.item?.performance ?? ''),

                          // Third tab view
                          Container(
                            child: controller.isSubscribed
                                ? ListView.builder(
                              itemCount: controller.item?.stock?.length ?? 0,
                                    itemBuilder: (context, index) => Card(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:  [
                                          Icon(Icons.arrow_back_ios),
                                          Text('${controller.item?.stock?[index].name}'),
                                          Text('${controller.item?.stock?[index].price}'),
                                      ],
                                    ),
                                        )),
                                  )
                                : Center(
                                    child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:  [
                                      const Icon(
                                        Icons.lock_open_outlined,
                                        color: AppColors.primary,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          'Subscribe to see the stocks in this portfolio.\n Plans start at just ${controller.item?.price}/-',
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
