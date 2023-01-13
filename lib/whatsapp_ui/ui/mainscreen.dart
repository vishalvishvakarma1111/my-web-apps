import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_app/whatsapp_ui/ui/userlist/user_list.dart';

import 'chat_screen/chat_screen.dart';

class WhatsAppView extends StatelessWidget {
  const WhatsAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraints) => Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  color: Colors.tealAccent[700],
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 40,
              right: 40,
              bottom: 20,
              top: 20,
              child: Get.width < 600
                  ? const UserListViewScreen()
                  : Get.width < 1250
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: Get.width * 0.4, child: const UserListViewScreen()),
                              SizedBox(width: Get.width * 0.6, child: const ChatScreenView()),
                            ],
                          ),
                        )
                      : Row(
                          children: const [
                            Expanded(flex: 15, child: UserListViewScreen()),
                            Expanded(
                              flex: 35,
                              child: ChatScreenView(),
                            ),
                          ],
                        ),
            )
          ],
        ),
      ),
    );
  }
}
