import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jio_poc/constants/app_constant.dart';
import 'package:jio_poc/data/model/dummy_model.dart';
import 'package:jio_poc/data/provider/api.dart';

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({@required this.apiClient}) : assert(apiClient != null);

  // get restaurants api
  Future<List<DummyModel>> getHomeData() async {
    var response = await apiClient.get(AppConstant.RESTAURANTS_URL);
    return dummyModelFromJson(json.encode(response));
  }
}
