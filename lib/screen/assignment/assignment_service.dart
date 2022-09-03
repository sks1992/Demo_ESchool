import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../model/base_model.dart';
import 'assignment_controller.dart';

// var controller = AssignmentController.to;
// var loading = true;
//
// class DataServices {
//   static Future<List<Welcome>> fetchData() async {
//     String url =
//         "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
//
//     Dio dio = Dio();
//
//     Response response = await dio.get(url);
//     // Get.back();
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       for (var item in response.data) {
//         controller.listData.add(Welcome.fromJson(item));
//       }
//       return controller.listData;
//     }
//     return null;
//   }
// }


AssignmentController assignmentController = Get.put(AssignmentController());

class DataServices {
  static Future<List<Welcome>> fetchData() async {
    String url =
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

    Dio dio = Dio();

    var response = await dio.get(url);
    // Get.back();
    if (response.statusCode == 200) {
      print(response.statusCode);
      for (var item in response.data) {
        assignmentController.listData.add(Welcome.fromJson(item));
        assignmentController.isLoading.value = false;

      }
      return assignmentController.listData;
    }
    return [];
  }
}

