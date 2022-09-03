import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../model/base_model.dart';
import 'assessment_services.dart';

class AssessmentController extends GetxController {
  bool allowWriteFile = false;
  String progress = "";
  late Dio dio;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  RxList<Welcome> listData = RxList<Welcome>([]);
  var _x;

  get x => _x;

  static get to => Get.find<AssessmentController>();

  @override
  void onInit() {
    AssessmentService.fetchData();
    super.onInit();
    dio = Dio();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future<void> _onSelectNotification(String? json) async {
    final obj = jsonDecode(json!);

    if (obj['isSuccess']) {
      OpenFile.open(obj['filePath']);
    } else {
      Get.snackbar('Error', 'Error File Download');
    }
  }

  Future<void> _showNotification(Map<String?, dynamic> downloadStatus) async {
    final android =AndroidNotificationDetails( 'channel id', 'channel name'); /*AndroidNotificationDetails(
        'channel id', 'channel name', 'channel description',
        priority: Priority.High, importance: Importance.Max);*/
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android: android, iOS: iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
        0, // notification id
        isSuccess ? 'Success' : 'Failure',
        isSuccess
            ? 'File has been downloaded successfully!'
            : 'There was an error while downloading the file.',
        platform,
        payload: json);
  }

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      // return await DownloadsPathProvider.downloadsDirectory;
    }
    return await getApplicationDocumentsDirectory();
  }

  // Future<bool> _requestPermissions() async {
  //   var permission = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.storage);
  //
  //   if (permission != PermissionStatus.granted) {
  //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //     permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  //
  //   return permission == PermissionStatus.granted;
  // }

  void onReceivedProgress() {
    Get.snackbar("Downloading", "Downloading Started");
  }

  Future<void> _startDownload(String savePath, String url) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await dio.download(
        url,
        savePath,
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      await _showNotification(result);
    }
  }

  Future<void> download(String url, String fileName) async {
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = true;
    fileName = "$fileName.jpg";
    if (isPermissionStatusGranted) {
      final savePath = path.join(dir.path, fileName);
      await _startDownload(savePath, url);
    } else {
      // handle the scenario when user declines the permissions
    }
  }
}
