import 'package:get/get.dart';
import 'package:untitled2/screen/assessments/assessments_screen.dart';
import 'package:untitled2/screen/assignment/assignment_screen.dart';
import 'package:untitled2/screen/class_schedule/class_schedule.dart';
import 'package:untitled2/screen/dashboard_screen.dart';
import 'package:untitled2/screen/fee_receipt/fee_receipt_screen.dart';
import 'package:untitled2/screen/login_screen.dart';
import 'package:untitled2/screen/profile/profile_screen.dart';
import 'package:untitled2/screen/splash_screen.dart';
import 'package:untitled2/screen/video/screens/video_screen.dart';

class RouteNames {
  static String splash = "/splash";
  static String login = "/login";
  static String dashboard = "/dashboard";
  static String profileScreen = "/profileScreen";
  static String assignmentScreen = "/assignmentScreen";
  static String classScheduleScreen = "/classScheduleScreen";
  static String videoScreen = "/videoScreen";
  static String assessmentScreen = "/assessmentScreen";
  static String feeReceiptScreen = "/feeReceiptScreen";

}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.splash,
      page: () =>  SplashScreenPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.login,
      page: () =>  LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.dashboard,
      page: () => DashBoard(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.dashboard,
      page: () => ProfileScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.assignmentScreen,
      page: () => AssignmentScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.classScheduleScreen,
      page: () => ClassScheduleScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.videoScreen,
      page: () => VideoScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.assessmentScreen,
      page: () => AssessmentScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.feeReceiptScreen,
      page: () => FeeReceiptScreen(),
      transition: Transition.cupertino,
    ),
  ];
}