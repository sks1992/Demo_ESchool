import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/app_route.dart';
import 'package:untitled2/screen/assessments/assessments_controller.dart';
import 'package:untitled2/screen/assignment/assignment_controller.dart';
import 'package:untitled2/screen/fee_receipt/fee_controller.dart';
import 'package:untitled2/screen/login_screen.dart';
import 'controller/login_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(AssignmentController());
    Get.put(AssessmentController());
    Get.put(FeeController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          color: Colors.deepPurple[100],
        ),
        primarySwatch: Colors.deepPurple,
        buttonColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
      initialRoute: RouteNames.login,
      getPages: AppRoute.route,
      unknownRoute: GetPage(name: '/', page: () => LoginScreen()),
    );
  }
}
