import 'package:flutter/material.dart';

import '../../my_drawer.dart';
import 'current_class_schedule.dart';
import 'ended_class_schedule.dart';

class ClassScheduleScreen extends StatelessWidget {
  static final String id = '/ClassScheduleScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Class Schedule",
          ),

          bottom: TabBar(
            indicator: BoxDecoration(color: Colors.deepPurple[400]),
            tabs: [Tab(text: "Current"), Tab(text: 'Ended')],
          ),
        ),
        body: TabBarView(
          children: [CurrentClassSchedule(), EndedClassScreen()],
        ),
      ),
    );
  }
}
