import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_app/model/common_model.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  int selectedIndex = 0;
  final matchList = [
    CommonModel(
      title: "INTERNATIONAL",
      list: [
        CommonModel2(title: "India v Sri Lanka, 2023", title2: "India vs Sri lanka", desc: "1st ODI"),
        CommonModel2(title: "", title2: "India vs Sri lanka", desc: "2ND ODI"),
        CommonModel2(title: "Pakistan v New Zealand", title2: "Pakistan v New Zealand", desc: "1st ODI"),
        CommonModel2(title: "", title2: "Pakistan v New Zealand", desc: "1st ODI"),
        CommonModel2(title: "Zimbabwe vs Ireland", title2: "Zimbabwe vs Ireland", desc: "1st ODI"),
      ],
    ),
    CommonModel(
      title: "T20 LEAGUE",
      list: [
        CommonModel2(title: "BBL 2022-23", title2: "Melbourne Stars vs Hobart Hurricanes", desc: "35th Match"),
        CommonModel2(title: "", title2: "Adelaide Strikers vs Melbourne Renegades", desc: "36th Match"),
        CommonModel2(title: "", title2: "Brisbane Heat vs Perth Scorchers", desc: "37th Match"),
        CommonModel2(title: "", title2: "Melbourne Stars vs Adelaide Strikers", desc: "38th Match"),
        CommonModel2(title: "", title2: "Paarl Royals vs MI Cape Town", desc: "1st Match"),
        CommonModel2(title: "SA20", title2: "Durban Super Giants vs Joburg Super Kings", desc: "2nd Match"),
        CommonModel2(title: "", title2: "Sunrisers Eastern Cape vs Pretoria Capitals", desc: "3rd Match"),
        CommonModel2(title: "BPL 2023", title2: "Comilla Victorians vs Sylhet Strikers", desc: "5th Match"),
        CommonModel2(title: "", title2: "Khulna Tigers vs Chattogram Challengers", desc: "6th Match"),
        CommonModel2(title: "", title2: "Rangpur Riders vs Fortune Barishal", desc: "7th Match"),
        CommonModel2(title: "", title2: "Sylhet Strikers vs Dhaka Dominators", desc: "8th Match"),
        CommonModel2(title: "Super Smash", title2: "Canterbury vs Northern Knights", desc: "16th Match"),
      ],
    ),
    CommonModel(
      title: "DOMESTIC",
      list: [
        CommonModel2(title: "Ranji Trophy", title2: "Arunachal Pradesh vs Sikkim  LIVE", desc: "Plate"),
        CommonModel2(title: "", title2: "Mumbai vs Assam", desc: "Elite Group B"),
        CommonModel2(title: "", title2: "Meghalaya vs Manipur", desc: "Plate"),
        CommonModel2(title: "", title2: "Baroda vs Bengal", desc: "Elite Group A"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "Ford Trophy", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
        CommonModel2(title: "", title2: "Jharkhand vs Chhattisgarh ", desc: "Elite Group c"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      height: 700,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chipsBtn(),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            matchData(),
          ],
        ),
      ),
    );
  }

  void changeIndex(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  Widget matchData() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: Get.width * 0.08,
        runSpacing: 30,
        direction: Axis.horizontal,
        children: List.generate(
          matchList.length,
          (index) {
            CommonModel itemOne = matchList[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemOne.title ?? "",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20, height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(itemOne.list?.length ?? 0, (position) {
                    CommonModel2 item = (itemOne.list ?? [])[position];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? "",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 5, height: 5),
                        Text(
                          item.title2 ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5, height: 5),
                        Text(
                          item.desc ?? "",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget chipsBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            child: ActionChip(
              onPressed: () => changeIndex(0),
              shape: const StadiumBorder(),
              label: Text(
                "All",
                style: TextStyle(color: selectedIndex == 0 ? Colors.grey[900] : Colors.white, fontSize: 12),
              ),
              backgroundColor: selectedIndex == 0 ? Colors.white12 : Colors.grey[900],
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          ),
          const SizedBox(width: 20, height: 20),
          SizedBox(
            height: 25,
            child: ActionChip(
              onPressed: () => changeIndex(1),
              shape: const StadiumBorder(),
              label: Text(
                "Live Now",
                style: TextStyle(color: selectedIndex == 1 ? Colors.grey[900] : Colors.white, fontSize: 12),
              ),
              backgroundColor: selectedIndex == 1 ? Colors.white12 : Colors.grey[900],
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          ),
          const SizedBox(width: 20, height: 20),
          SizedBox(
            height: 25,
            child: ActionChip(
              onPressed: () => changeIndex(2),
              shape: const StadiumBorder(),
              label: Text(
                "Today",
                style: TextStyle(color: selectedIndex == 2 ? Colors.grey[900] : Colors.white, fontSize: 12),
              ),
              backgroundColor: selectedIndex == 2 ? Colors.white12 : Colors.grey[900],
              padding: const EdgeInsets.all(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
