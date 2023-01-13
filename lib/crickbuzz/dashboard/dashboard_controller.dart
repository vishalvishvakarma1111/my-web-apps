import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../model/common_model.dart';
import '../../util/mybasecontroller.dart';

class DashboardController extends MyBaseController {
  RxBool showAllSchedule = false.obs;
  RxInt selectedTabIndex = 0.obs;
  final specialList = [
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img:
          "https://images.pexels.com/photos/2096543/pexels-photo-2096543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img: "https://images.pexels.com/photos/7583935/pexels-photo-7583935.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img: "https://images.pexels.com/photos/7232670/pexels-photo-7232670.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img:
          "https://images.pexels.com/photos/2096543/pexels-photo-2096543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img: "https://images.pexels.com/photos/7583935/pexels-photo-7583935.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img: "https://images.pexels.com/photos/7232670/pexels-photo-7232670.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img:
          "https://images.pexels.com/photos/2096543/pexels-photo-2096543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img: "https://images.pexels.com/photos/7583935/pexels-photo-7583935.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
    CommonModel(
      title: "The good Samaritans who came to Rishabh Pant's rescue",
      title2:
          "Bus driver Sushil and conductor Paramjeet, who rushed to help Rishabh Pant, recalled the turn of events in the wee hours of Friday morningr",
      img: "https://images.pexels.com/photos/7232670/pexels-photo-7232670.jpeg?auto=compress&cs=tinysrgb&w=1600",
    ),
  ];

  final latestNewsList = [
    CommonModel(title: "Todd Murphy handed maiden call-up for India Test tour", title2: "8h ago"),
    CommonModel(title: "Feels good when the captain backs you - Shubman Gill", title2: "8h ago"),
    CommonModel(title: "Lynn's power-hitting helps Strikers down Renegades", title2: "8h ago"),
    CommonModel(title: "TMickey Arthur not to reprise his role as Pakistan coach", title2: "8h ago"),
    CommonModel(title: "Georgia Wareham named in Australia's T20 World Cup squad", title2: "8h ago"),
    CommonModel(title: "Todd Murphy handed maiden call-up for India Test tour", title2: "8h ago"),
    CommonModel(title: "Feels good when the captain backs you - Shubman Gill", title2: "8h ago"),
    CommonModel(title: "Lynn's power-hitting helps Strikers down Renegades", title2: "8h ago"),
    CommonModel(title: "TMickey Arthur not to reprise his role as Pakistan coach", title2: "8h ago"),
    CommonModel(title: "Georgia Wareham named in Australia's T20 World Cup squad", title2: "8h ago"),
    CommonModel(title: "Todd Murphy handed maiden call-up for India Test tour", title2: "8h ago"),
    CommonModel(title: "Feels good when the captain backs you - Shubman Gill", title2: "8h ago"),
    CommonModel(title: "Lynn's power-hitting helps Strikers down Renegades", title2: "8h ago"),
    CommonModel(title: "TMickey Arthur not to reprise his role as Pakistan coach", title2: "8h ago"),
    CommonModel(title: "Georgia Wareham named in Australia's T20 World Cup squad", title2: "8h ago"),
  ];
  final list = [
    CommonModel(title: "MATCHES"),
    CommonModel(title: "IND-vs-SL-Live"),
    CommonModel(title: "SA-Aus-Complete"),
    CommonModel(title: "PAK-NZ-Preview"),
    CommonModel(title: "BAN-WI-Preview"),
    CommonModel(title: "MI-CSK-Preview"),
  ];
  final featureMatchList = [
    CommonModel(title: "IND", title2: "373-7 (50)", title3: "SL", title4: "306-8 (50)", desc: "India won by 67 runs"),
    CommonModel(title: "Pakistan", title2: "", title3: "New Zeland", title4: "", desc: "Today, 03:00 PM"),
    CommonModel(title: "BRH", title2: "14-0 (2)", title3: "PRS", title4: "", desc: "Perth Scorchers opt to bowl"),
    CommonModel(
        title: "Mum",
        title2: "689-7d ",
        title3: "ASM",
        title4: "50-0",
        desc: "Day 2: 3rd Session - Assam trail by 638 runs"),
    CommonModel(title: "IND", title2: "373-7 (50)", title3: "SL", title4: "306-8 (50)", desc: "India won by 67 runs"),
    CommonModel(title: "Pakistan", title2: "", title3: "New Zeland", title4: "", desc: "Today, 03:00 PM"),
    CommonModel(title: "BRH", title2: "14-0 (2)", title3: "PRS", title4: "", desc: "Perth Scorchers opt to bowl"),
    CommonModel(
        title: "Mum",
        title2: "689-7d ",
        title3: "ASM",
        title4: "50-0",
        desc: "Day 2: 3rd Session - Assam trail by 638 runs"),
    CommonModel(title: "IND", title2: "373-7 (50)", title3: "SL", title4: "306-8 (50)", desc: "India won by 67 runs"),
    CommonModel(title: "Pakistan", title2: "", title3: "New Zeland", title4: "", desc: "Today, 03:00 PM"),
    CommonModel(title: "BRH", title2: "14-0 (2)", title3: "PRS", title4: "", desc: "Perth Scorchers opt to bowl"),
    CommonModel(
        title: "Mum",
        title2: "689-7d ",
        title3: "ASM",
        title4: "50-0",
        desc: "Day 2: 3rd Session - Assam trail by 638 runs"),
  ];
}
