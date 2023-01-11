import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../model/common_model.dart';
import '../util/const.dart';

class HeaderView extends StatelessWidget {
  final list = [
    CommonModel(
      title: "Live Scores",
    ),
    CommonModel(
      title: "Schedules",
    ),
    CommonModel(
      title: "Archives",
    ),
    CommonModel(title: "News", selected: true),
    CommonModel(title: "Series", selected: true),
    CommonModel(title: "Teams", selected: true),
    CommonModel(title: "Videos", selected: true),
    CommonModel(title: "Ranking", selected: true),
    CommonModel(title: "More", selected: true),
  ];

  HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: green,
      height: kToolbarHeight,
      child: Row(
        children: [
          const SizedBox(width: 20, height: 20),
          Image.asset(
            "${imagePath}cricbuzz_logo.png",
            color: Colors.white,
            height: 40,
          ),
          const SizedBox(width: 20, height: 20),
          Get.width < 600
              ? const SizedBox.shrink()
              : Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        list.length,
                        (index) {
                          var item = list[index];
                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
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
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
          rightAccountView(),
        ],
      ),
    );
  }

  Widget rightAccountView() {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {},
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Text(
            "Crickbuzz Plus",
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
