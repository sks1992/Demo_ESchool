import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  final Color? color;
  final String? text;

  ProfileText({this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 16),
    );
  }
}
