import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_drawer.dart';
import 'assignment_controller.dart';
import 'assignment_tile.dart';

class AssignmentScreen extends StatelessWidget {
  static final String id = '/AssignmentScreen';
  AssignmentController assignmentController = Get.put(AssignmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Assignment",)

        ),
        body: GetX<AssignmentController>(
          init: AssignmentController(),

          builder: (assignmentController) =>assignmentController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: assignmentController.listData.length,
            itemBuilder: (context, index) {
              return AssignmentTile(assignmentController.listData[index]);
            },
          ),
        ));
  }
}
