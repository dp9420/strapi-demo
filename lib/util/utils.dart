import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_color.dart';

class Utils {
  static bool isMobile(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var isMobile = shortestSide < 600;
    if (isMobile) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isConnectedToInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static void showLoadingDialog() {
    Get.generalDialog(
        barrierColor: Colors.white.withOpacity(0.2),
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SizedBox.expand(
              // makes widget fullscreen
              child: Center(
                child: Card(
                    color: Colors.white.withOpacity(.9),
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: new CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: new AlwaysStoppedAnimation<Color>(FF265AC2),
                      ),
                    )),
              ),
            ));
  }

  static void dismissLoadingDialog() {
    Get.back();
  }

  static void showErrorSnackBar(String error) {
    Get.snackbar("Error", error,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        maxWidth: 400,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  static void showSucessSnackBar(String error) {
    Get.snackbar("Sucess", error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        maxWidth: 400,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10));
  }

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  static void printLog(String msg) {
    print("Log : $msg");
  }
}
