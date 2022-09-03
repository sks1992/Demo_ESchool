import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/base_model.dart';
import 'fee_controller.dart';





var controller= FeeController.to;

class FeeService {

  static Future<List<Welcome>> fetchData() async {
    String url = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

    Dio dio = Dio();
    Response response = await dio.get(url);
    // Get.back();
    if (response.statusCode == 200) {

      print(response.statusCode);
      for (var item in response.data) {
        controller.listData.add(Welcome.fromJson(item));

      }
      return controller.listData;
    }
    return [];
  }
}
