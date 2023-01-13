import 'package:flutter/material.dart';

import '../../util/const.dart';

class BottomView extends StatelessWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 15,
                child: Image.asset(
                  "${imagePath}cricbuzz_logo.png",
                  color: Colors.white,
                  height: 30,
                ),
              ),
              Expanded(
                  flex: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title("MOBILE SITE & APPS"),
                      const SizedBox(width: 20, height: 20),
                      buildItem("m.crickbuzz.com", Icons.web),
                      const SizedBox(width: 20, height: 15),
                      buildItem("Android", Icons.android),
                      const SizedBox(width: 20, height: 15),
                      buildItem("IOS", Icons.apple_rounded)
                    ],
                  )),
              Expanded(
                  flex: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title("FOLLOW ON"),
                      const SizedBox(width: 20, height: 20),
                      buildItem("Facebook", Icons.facebook),
                      const SizedBox(width: 20, height: 15),
                      buildItem("Twitter", Icons.transfer_within_a_station),
                      const SizedBox(width: 20, height: 15),
                      buildItem("Youtube", Icons.video_settings),
                      const SizedBox(width: 20, height: 15),
                      buildItem("Pinterest", Icons.pinch_outlined),
                    ],
                  )),
              Expanded(
                  flex: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title("COMPANY"),
                      const SizedBox(width: 20, height: 20),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Advertise",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20, height: 15),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20, height: 15),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Terms of Use",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20, height: 15),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Cricbuzz TV Ads",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(width: 20, height: 20),
          const Text(
            "© 2023 Cricbuzz.com, Times Internet Limited. All rights reserved | The Times of India | Navbharat Times",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildItem(String title, IconData icon) {
    return Wrap(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
