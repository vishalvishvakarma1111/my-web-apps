import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/const.dart';
import 'chat_controller.dart';
import 'dart:math' as math;

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChatController(),
      builder: (ChatController controller) => Scaffold(
        appBar: const MyAppBar(),
        body: Container(
          color: cream,
          child: Column(children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: controller.messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.messageList[index];
                      return item.isUser ? rightItem(item) : leftItem(item);
                    },
                  )),
            ),
            TextField(
              controller: controller.messageController,
              onSubmitted: (query) => controller.onSubmit(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.grey,
                  ),
                  onPressed: () => controller.onSubmit(),
                ).paddingSymmetric(horizontal: 10),
                filled: true,
                hintText: "Start typing here...",
                hintStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ).paddingSymmetric(horizontal: 10)
          ]),
        ),
      ),
    );
  }

  Widget leftItem(ChatMessage item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(Colors.white),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: item.messageType == MessageType.image
                ? buildImage(item.url ?? "")
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.message,
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(width: 5, height: 20),
                      const Text(
                        "01: 20 pm",
                        style: TextStyle(color: Colors.grey, fontSize: 8),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget rightItem(ChatMessage item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: sightGreen,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: item.messageType == MessageType.image
                ? buildImage(item.url ?? "")
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        item.message,
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(width: 5, height: 20),
                      const Text(
                        "01: 20 pm",
                        style: TextStyle(color: Colors.grey, fontSize: 8),
                      ),
                    ],
                  ),
          ),
        ),
        CustomPaint(painter: Triangle(sightGreen)),
      ],
    );
  }

  Widget buildImage(String url) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

// Create a custom triangle
class Triangle extends CustomPainter {
  final Color backgroundColor;

  Triangle(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backgroundColor;

    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: wtAppbar,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/2096543/pexels-photo-2096543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 10, height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Pravin",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "last seen today at 09 :23 am",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight);
}
