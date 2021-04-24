import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jio_poc/features/home/controller/home_controller.dart';

class Header extends StatelessWidget {
  String title;

  Header({this.title});

  @override
  Widget build(BuildContext context) {
    print("title : ${title}");
    return GetBuilder<HomeController>(builder: (_) {
      return Container(
        height: 160,
        width: Get.width,
        color: Colors.black,
        child: Center(
          child: Text(
            "Restaurants",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
      );
    });
  }
}
