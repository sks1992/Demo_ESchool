import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/asset_path.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();
  static const String id = '/Login_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(reqelford, height: 200, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Log-in",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                color: Colors.deepPurple),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller:
                                loginController.userNameEditingController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              labelText: 'UserName',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller:
                                loginController.passwordEditingController,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.orange,
                                ),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton.icon(
                              onPressed: () {
                                loginController.loginAuth();
                              },
                              elevation: 5,
                              textColor: Colors.white,
                              label: Text('LOGIN'),
                              color: Colors.deepPurple,
                              icon: Icon(Icons.login),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: 'Message',
                                  middleText:
                                      'Kindly Contact the School Admin !! \n ',
                                  textCancel: 'Cancle');
                            },
                            child: Text('Forgot Password ?'),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
