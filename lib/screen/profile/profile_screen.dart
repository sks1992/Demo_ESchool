import 'package:flutter/material.dart';
import 'package:untitled2/screen/profile/profile_card.dart';
import 'package:untitled2/screen/profile/profile_text.dart';

import '../../my_drawer.dart';


class ProfileScreen extends StatelessWidget {
  static final String id = "/ProfileScreen";
  // final Welcome welcome;
  //
  // ProfileScreen({this.welcome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Profile",
        ),
      ),
      endDrawer: MyDrawer(),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 30,
                ),
                ProfileCard(
                  startColor: Color.fromRGBO(254, 124, 150, 1),
                  endColor: Color.fromRGBO(255, 190, 150, 1),
                  column: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Demo Student",
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.person)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Gender',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: "Male",
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Date of Birth',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: '02/03/1999',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Blood Group',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'b+',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Mobile Number',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: '9881177228',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Email',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'sumedchaus@gmail.com',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ProfileCard(
                  startColor: Color.fromRGBO(25, 138, 227, 1),
                  endColor: Color.fromRGBO(141, 201, 249, 1),
                  column: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reqelford \nInternational \nSchool-Rampally",
                            style: TextStyle(fontSize: 25),
                          ),

                          Icon(Icons.school)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Student Code',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: "1300165",
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Grade',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: '|||',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Section',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'G3 A',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Syllabus ',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'CBSE',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Acadmic Year',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'AY2021-22',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ProfileCard(
                  endColor: Color.fromRGBO(131, 217, 210, 1),
                  startColor: Color.fromRGBO(30, 208, 131, 1),
                  column: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Parents",
                            style: TextStyle(fontSize: 25),
                          ),

                          Icon(Icons.supervised_user_circle)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Father ',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: "xxx",
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Mobile',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxxxxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Email',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxx@gmail.com',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Mother ',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Mobile',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxxxxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ProfileCard(
                  endColor: Colors.purple.shade300,
                  startColor: Colors.deepPurpleAccent,
                  column: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 25),
                          ),

                          Icon(Icons.location_on_outlined)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: ' House No',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: "xx-x-xx,",
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Street',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxxx-xxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Mandal',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'City ',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'District',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxxx',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileText(
                        text: 'Pin code',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ProfileText(
                        text: 'xxxxxxx',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
