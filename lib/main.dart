import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_sample/src/controller/screen_layout_controller.dart';
import 'package:layout_sample/src/pages/flutter_page.dart';
import 'package:layout_sample/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ScreenLayoutController());
      }),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/flutter",
          page: () => FlutterPage(),
        )
      ],
    );
  }
}
