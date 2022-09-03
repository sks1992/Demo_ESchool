import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

class ListTileDrawer extends StatelessWidget {
 final LoginController loginController = Get.find<LoginController>();
  final String? text;
  final VoidCallback? onTap;
  final Icon? icon;
  final Icon? iconLeading;

  ListTileDrawer(
      { this.text, this.onTap, this.icon, this.iconLeading});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text!,
          style: loginController.colorBool.value
              ? TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black)
              : TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black)),
      onTap: onTap,
      trailing: icon,
      leading: iconLeading,
    );
  }
}
