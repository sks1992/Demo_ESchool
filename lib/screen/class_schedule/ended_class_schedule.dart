import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../icon_with_text.dart';

class EndedClassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.deepPurple[100],
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EndedClassCard(subject: "Computer", subTopic: "Operating System"),
            EndedClassCard(subject: "Maths", subTopic: "Trigonometry"),
            EndedClassCard(subject: "English", subTopic: "Grammar"),
            EndedClassCard(subject: "Physic", subTopic: "Vector"),
            EndedClassCard(subject: "Biology", subTopic: "Cells"),
          ],
        ),
      ),
    );
  }
}

class EndedClassCard extends StatelessWidget {
  final String subject;
  final String subTopic;

  EndedClassCard({required this.subject, required this.subTopic});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subTopic,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            IconWithText(
              icon: const Icon(
                Icons.schedule,
                size: 15,
                color: Colors.grey,
              ),
              text: ' ${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
            ),
            const SizedBox(height: 5),
            IconWithText(
              icon: const Icon(
                Icons.timer_sharp,
                size: 15,
                color: Colors.grey,
              ),
              text: ' 45 min. Duration.',
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.red,
              child: Text(
                "Absent",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
