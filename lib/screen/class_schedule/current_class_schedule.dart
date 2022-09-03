import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assignment/assignment_controller.dart';
import 'class_tile.dart';

class CurrentClassSchedule extends StatelessWidget {
  static final String id = '/AssignmentScreen';

  final AssignmentController assignmentController =
      Get.put<AssignmentController>(AssignmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: assignmentController.listData.length,
          itemBuilder: (context, index) {
            return ClassTile(assignmentController.listData[index]);
          },
        ),
      ),
    );
  }
}
