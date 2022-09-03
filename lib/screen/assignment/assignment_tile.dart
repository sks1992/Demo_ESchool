import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../colorful_buttons.dart';
import '../../icon_with_text.dart';
import '../../model/base_model.dart';
import 'assignment_controller.dart';

class AssignmentTile extends StatelessWidget {
  final Welcome welcome;

  AssignmentTile(this.welcome);

  final AssignmentController assignmentController = Get.find<AssignmentController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AssignmentText(
                      textBackgroundColor: Colors.deepPurple[400]!,
                      title:
                          ' ${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
                    ),
                    const SizedBox(height: 5),
                    AssignmentText(
                      title: " ${welcome.name}",
                      textBackgroundColor: Colors.red[400]!,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " ${welcome.category}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                              const SizedBox(
                                width: 15,
                              ),
                              IconWithText(
                                  icon: const Icon(
                                    Icons.info_outline,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  text: " ${welcome.price}"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          IconWithText(
                            icon: const Icon(
                              Icons.error_outline,
                              size: 15,
                              color: Colors.redAccent,
                            ),
                            text: '  Submitted/Not Yet',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ColorfulButtons(
                                text: 'Download',
                                onTap: () {
                                  assignmentController.onReceivedProgress();
                                  assignmentController.download(
                                      welcome.imageLink!, welcome.name!);
                                },
                                buttonColor: Colors.purple[100]!,
                                textColor: Colors.purple,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ColorfulButtons(
                                text: "Upload",
                                textColor: Colors.blue,
                                buttonColor: Colors.blue[100]!,
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ColorfulButtons(
                                buttonColor: Colors.green[100]!,
                                text: 'View File',
                                textColor: Colors.green,
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ),
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

class AssignmentText extends StatelessWidget {
  final Color textBackgroundColor;
  final String title;

  AssignmentText({required this.textBackgroundColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: textBackgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
