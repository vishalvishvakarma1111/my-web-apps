import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_app/dashboard/dashboard_controller.dart';
import 'package:native_app/dashboard/schedule_view.dart';

import '../util/const.dart';
import 'bottom_view.dart';
import 'header_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var isMobile = Get.width < 600;
                return Obx(() => Container(
                      color: bgColor,
                      child: Column(
                        children: [
                          isMobile
                              ? homeBody(controller)
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: (Get.width * 0.006).toInt(),
                                      child: Container(),
                                    ),
                                    Expanded(
                                      flex: 30,
                                      child: homeBody(controller),
                                    ),
                                    Expanded(
                                      flex: (Get.width * 0.006).toInt(),
                                      child: Container(),
                                    ),
                                  ],
                                ),
                          isMobile ? const SizedBox.shrink() : const BottomView(),
                        ],
                      ),
                    ));
              },
            ),
          ),
        );
      },
    );
  }

  Widget homeBody(DashboardController controller) {
    return Column(
      children: [
        HeaderView(),
        tabView(controller),
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: controller.showAllSchedule.value ? const ScheduleView() : const SizedBox.shrink()),
        const SizedBox(width: 20, height: 5),
        _buildFeatureMatch(controller),
        const SizedBox(width: 20, height: 5),
        Get.width > 600
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 15, child: latestNews(controller)),
                  const SizedBox(width: 5, height: 5),
                  Expanded(flex: 30, child: specials(controller)),
                  const SizedBox(width: 5, height: 5),
                  Expanded(flex: 20, child: specials(controller)),
                  const SizedBox(width: 5, height: 5),
                ],
              )
            : Column(
                children: [
                  latestNews(controller),
                  const SizedBox(width: 5, height: 5),
                  specials(controller),
                  const SizedBox(width: 5, height: 5),
                  specials(controller),
                  const SizedBox(width: 5, height: 5),
                ],
              ),
      ],
    );
  }

  Widget tabView(DashboardController controller) {
    return Container(
      color: Colors.grey[800],
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  controller.list.length,
                  (index) {
                    var item = controller.list[index];
                    return InkWell(
                      onTap: () {
                        controller.selectedTabIndex.value = index;
                      },
                      child: Container(
                        color: controller.selectedTabIndex.value == index ? Colors.grey[900] : Colors.grey[800],
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item.title ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Visibility(
                              visible: item.selected ?? false,
                              child: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              controller.showAllSchedule.value = !controller.showAllSchedule.value;
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.showAllSchedule.value ? "CLOSE" : "ALL",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildFeatureMatch(DashboardController controller) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20, height: 20),
          Text(
            "FEATURED MATCHES",
            style: TextStyle(
              color: green,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 20, height: 20),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.featureMatchList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.featureMatchList[index];
                return SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title ?? "",
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.title2 ?? "",
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20, height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title3 ?? "",
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.title4 ?? "",
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20, height: 10),
                      Text(
                        item.desc ?? "",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const VerticalDivider(
                    thickness: 1,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget latestNews(DashboardController controller) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20, height: 10),
          Text(
            "LATEST NEWS",
            style: TextStyle(
              color: green,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 20, height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = controller.latestNewsList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title ?? "",
                  ),
                  Text(
                    item.title2 ?? "",
                  ),
                ],
              );
            },
            itemCount: controller.latestNewsList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ],
      ),
    );
  }

  Widget specials(DashboardController controller) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var item = controller.specialList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.img ?? "",
                  width: double.maxFinite,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (a, b, c) => const Icon(Icons.error),
                ),
              ),
              Text(
                item.title ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item.title2 ?? "",
              ),
            ],
          );
        },
        itemCount: controller.specialList.length,
      ),
    );
  }
}
