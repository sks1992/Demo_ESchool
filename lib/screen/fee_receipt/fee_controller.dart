import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
//import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/base_model.dart';

class FeeController extends GetxController {
  late Dio dio;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  RxBool loading = true.obs;

  RxList<Welcome> listData = RxList<Welcome>();

  static get to => Get.find<FeeController>();

  @override
  void onInit() {
    fetchData();
    loading.value = true;
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
      // showDialog(
      //   context: context,
      //   builder: (_) => AlertDialog(
      //     title: Text('Error'),
      //     content: Text('${obj['error']}'),
      //   ),
      // );
    }
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails(
        'channel id', 'channel name');
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

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<List<Welcome>> fetchData() async {
    String url =
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

    Dio dio = Dio();

    var response = await dio.get(url);
    // Get.back();
    if (response.statusCode == 200) {
      print(response.statusCode);
      for (var item in response.data) {
        listData.add(Welcome.fromJson(item));
        loading.value = false;
      }
      return listData;
    }
    return [];
  }
}
