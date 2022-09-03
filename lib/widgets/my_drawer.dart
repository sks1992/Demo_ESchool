import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../const/asset_path.dart';
import '../controller/login_controller.dart';
import '../screen/assessments/assessments_screen.dart';
import '../screen/assignment/assignment_screen.dart';
import '../screen/class_schedule/class_schedule.dart';
import '../screen/dashboard_screen.dart';
import '../screen/fee_receipt/fee_receipt_screen.dart';
import '../screen/profile/profile_screen.dart';
import '../screen/video/screens/video_screen.dart';
import 'list_expansion_tile.dart';
import 'list_tile_drawer.dart';

class MyDrawer extends StatelessWidget {
 final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: [
            Container(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    // color: Colors.deepPurple,
                    ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      // backgroundImage: AssetImage(profileImage),
                      backgroundColor: Colors.transparent, //temperory
                      child: Image.asset(profileImage),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loginController.userNameEditingController.text,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'xxxxxxxxxxxxxx',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTileDrawer(
              icon: Icon(Icons.dashboard_customize),
              text: 'Dashboard',
              onTap: () {
                Get.toNamed(DashBoard.id);
              },
            ),
            ListTileDrawer(
                text: 'Profile',
                onTap: () {
                  Get.toNamed(ProfileScreen.id);
                },
                icon: Icon(Icons.person)),
            ListTileDrawer(
                text: 'Class Schedules',
                onTap: () {
                  Get.toNamed(ClassScheduleScreen.id);
                },
                icon: Icon(Icons.menu)),
            ListTileDrawer(
                text: 'Assignments',
                onTap: () {
                  Get.toNamed(AssignmentScreen.id);
                },
                icon: Icon(Icons.phone_in_talk_sharp)),
            ListExpandedTileView(
              title: 'Assessments',
              icon1: Icon(Icons.note_add),
              expansionListTile: Column(
                children: [
                  ListTileDrawer(
                    iconLeading: Icon(Icons.arrow_forward),
                    text: 'Assesments',
                    onTap: () {
                      Get.toNamed(AssessmentScreen.id);

                    },
                  ),
                  ListTileDrawer(
                    iconLeading: Icon(Icons.arrow_forward),
                    text: 'Computerbased Test',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ListExpandedTileView(
              title: 'Video Library',
              icon1: Icon(Icons.video_collection),
              expansionListTile: Column(
                children: [
                  ListTileDrawer(
                    iconLeading: Icon(Icons.arrow_forward),
                    text: 'Genral Videos',
                    onTap: () {
                      Get.toNamed(VideoScreen.id);
                    },
                  ),
                  ListTileDrawer(
                    iconLeading: Icon(Icons.arrow_forward),
                    text: 'Acadmic Videos',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ListTileDrawer(
                text: 'Report Card',
                onTap: () {},
                icon: Icon(Icons.credit_card_rounded)),
            ListTileDrawer(
                text: 'Fee Receipts', onTap: () {
              Get.toNamed(FeeReceiptScreen.id);

            }, icon: Icon(Icons.receipt)),
          ],
        ),
      ),
    );
  }
}
