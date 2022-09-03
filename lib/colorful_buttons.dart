import 'package:flutter/material.dart';

class ColorfulButtons extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final Icon? buttonIcon;
  final VoidCallback? onTap;

  ColorfulButtons(
      {required this.text,
      required this.textColor,
      required this.buttonColor,
      this.buttonIcon,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RaisedButton(
      onPressed: onTap,
      child: Text(
        text!,
        style: TextStyle(color: textColor),
      ),
      color: buttonColor,
    ));
  }
}
