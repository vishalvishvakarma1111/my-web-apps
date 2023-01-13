import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_app/whatsapp_ui/ui/mainscreen.dart';

import 'crickbuzz/dashboard/dashboard_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: "/whatsapp-view",
          page: () => const WhatsAppView(),
        ),
        GetPage(
          name: "/dashboard-crb",
          page: () => const CrickBuzzDashBoardView(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scrollbarTheme: const ScrollbarThemeData().copyWith(
            thumbVisibility: MaterialStateProperty.all(true),
            thickness: MaterialStateProperty.all(10),
          )),

      ///   home: const DashboardView(),/// crickbuzz
      ///    home:   Chat(), /// chat gpt
      home: const MainScreen(),

      /// chat gpt
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.fill),
          ),
          padding: const EdgeInsets.all(20),
          height: double.maxFinite,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBtn(() {
                Get.toNamed('/dashboard-crb');
              }, "CrickBuzz"),
              const SizedBox(width: 20, height: 20),
              buildBtn(() {
                Get.toNamed('/whatsapp-view');
              }, "Whatsapp"),
            ],
          )

          /*GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            buildBtn(() {
              Get.toNamed('/dashboard-crb');
            }, "CrickBuzz"),
            buildBtn(() {
              Get.toNamed('/whatsapp-view');

            }, "Whatsapp"),
          ],
        ),*/
          ),
    );
  }

  buildBtn(Function() onPressed, String title) {
    return LayoutBuilder(
        builder: (context, c) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(Get.width * .04),
                  backgroundColor: Colors.orangeAccent[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: onPressed,
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ));
  }
}
