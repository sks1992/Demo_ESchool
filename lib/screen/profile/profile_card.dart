import 'package:flutter/material.dart';

import 'my_painter.dart';


class ProfileCard extends StatelessWidget {
  final Color? startColor;
  final Color? endColor;
  final Column? column;

  ProfileCard({this.column, this.endColor,this.startColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),

      child: Container(
        decoration: BoxDecoration(

            gradient: LinearGradient(begin: Alignment.centerLeft,end: Alignment.centerRight,
                colors: [endColor!, startColor!])
        ),
        child: CustomPaint(
          painter: MyPainter(),
          child: Padding(
              padding: const EdgeInsets.all(50.0),
              child:column

          ),
        ),
      ),
    );
  }
}

