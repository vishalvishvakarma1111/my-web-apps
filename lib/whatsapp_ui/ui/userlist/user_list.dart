import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_app/whatsapp_ui/ui/userlist/userlist_controller.dart';

import '../../../util/const.dart';

class UserListViewScreen extends StatelessWidget {
  const UserListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserListController(),
      builder: (UserListController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: wtAppbar,
            title: const Text(
              "Whatsapp",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child: const Text(
                "A",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          body: Scrollbar(
            isAlwaysShown: true,
            controller: controller.scrollController,
            child: ListView.separated(
              controller: controller.scrollController,
              itemCount: controller.userList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.userList[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("${item.img}"),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    item.title ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    item.title2 ?? "",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Text(
                    "3:00 pm",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ),
        );
      },
    );
  }
}
