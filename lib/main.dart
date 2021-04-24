import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jio_poc/routing/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePage,
      getPages: AppPages.routes,
      title: "JioMedia",
      defaultTransition: Transition.leftToRight,
    );
  }
}
