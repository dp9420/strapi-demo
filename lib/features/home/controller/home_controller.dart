import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jio_poc/data/model/dummy_model.dart';
import 'package:jio_poc/data/repository/api_repository.dart';

class HomeController extends GetxController {
  final ApiRepository repository;

  HomeController({@required this.repository}) : assert(repository != null);

  List<DummyModel> model;
  bool isHomeLoading = true;

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  void getHomeData() async {
    try {
      isHomeLoading = true;
      var response = await repository.getHomeData();
      if (response != null) {
        model = response;
        update();
      }
      isHomeLoading = false;
      update();
    } catch (e) {
      print(e.toString());
      isHomeLoading = false;
      update();
    }
  }
}
