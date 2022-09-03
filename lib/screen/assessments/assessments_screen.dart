import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../my_drawer.dart';
import 'assessment_tile.dart';
import 'assessments_controller.dart';

class AssessmentScreen extends StatelessWidget {
  static String id = "/AssessmentScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Assessments",)
        ),
        body: GetX<AssessmentController>(
          init: AssessmentController(),
          builder: (assessmentController) => ListView.builder(
            itemCount: assessmentController.listData.length,
            itemBuilder: (context, index) {
              return AssessmentTile(assessmentController.listData[index]);
            },
          ),
        ));
  }
}
