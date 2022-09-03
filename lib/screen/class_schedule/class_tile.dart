import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../const/style.dart';
import '../../icon_with_text.dart';
import '../../model/base_model.dart';
import '../assignment/assignment_controller.dart';


class ClassTile extends StatelessWidget {
  final Welcome welcome;

  ClassTile(this.welcome);

  final AssignmentController assignmentController =
      Get.put<AssignmentController>(AssignmentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.deepPurple[100],
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        welcome.name!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        welcome.brand.toString(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          IconWithText(
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                            text:
                                ' ${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
                          ),
                          const SizedBox(width: 15),
                          IconWithText(
                              icon: const Icon(
                                Icons.info_outline,
                                size: 15,
                                color: Colors.grey,
                              ),
                              text: " ${welcome.price}"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      IconWithText(
                        icon: const Icon(
                          Icons.error_outline,
                          size: 15,
                          color: Colors.redAccent,
                        ),
                        text: '  45 min Duration',
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                assignmentController
                                    .launchInBrowser(welcome.imageLink!);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple[200],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.forward,
                                    color: Colors.deepPurple,
                                  ),
                                  Text("Join Class Room",
                                      style: k_ClassTile_ElevatedButton_Text),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AssignmentText extends StatelessWidget {
  final Color textBackgroundColor;
  final String title;

  AssignmentText({required this.textBackgroundColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: textBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
