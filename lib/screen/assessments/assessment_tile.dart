import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../icon_with_text.dart';
import '../../model/base_model.dart';
import 'assessments_controller.dart';


class AssessmentTile extends StatelessWidget {
  final Welcome welcome;

  AssessmentTile(this.welcome);

  final AssessmentController assessmentController =
      Get.find<AssessmentController>();
  final String now = DateFormat().add_yMMMMEEEEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding:  EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Text(
                        "${welcome.name}",
                        style: TextStyle(
                            // color: Colors.black,
                            //   fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      welcome.productType!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        text: "  $now"),
                    SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icon(
                          Icons.watch_later_outlined,
                          size: 15,
                          color: Colors.grey,
                        ),
                        text: "  Submit Before"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$now',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icon(
                          Icons.error_outline,
                          size: 15,
                          color: Colors.red,
                        ),
                        text: " Not Yet / Submitted"),
                    SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icon(
                          Icons.error_outline,
                          size: 15,
                          color: Colors.red,
                        ),
                        text: "Expired"),
                    RaisedButton.icon(
                      onPressed: () {
                        assessmentController.onReceivedProgress();
                        assessmentController.download(
                            welcome.imageLink!, welcome.name!);
                      },
                      icon: Icon(
                        Icons.download,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Download",
                        style: TextStyle(color: Colors.purple),
                      ),
                      color: Colors.deepPurple[100],
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        Get.defaultDialog(
                          content: Icon(
                            Icons.cancel_outlined,
                            size: 100,
                            color: Colors.red,
                          ),
                          title: "Message",
                          textCustom: "No Answer Sheet Uploaded",
                          textCancel: 'ok',
                        );
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Upload Answer Sheet",
                        style: TextStyle(color: Colors.green),
                      ),
                      color: Colors.greenAccent[100],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
