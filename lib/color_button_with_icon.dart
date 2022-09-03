import 'package:flutter/material.dart';

class ColorfulButtonWithIcon extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final Icon? buttonIcon;
  final VoidCallback? onTap;

  ColorfulButtonWithIcon(
      {@required this.text,
      @required this.textColor,
      @required this.buttonColor,
      @required this.buttonIcon,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RaisedButton.icon(
      onPressed: onTap,
      label: Text(
        text!,
        style: TextStyle(color: textColor),
      ),
      color: buttonColor,
      icon: buttonIcon!,
    ));
  }
}
