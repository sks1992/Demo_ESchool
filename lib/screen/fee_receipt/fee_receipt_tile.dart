import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../icon_with_text.dart';
import '../../model/base_model.dart';
import 'fee_controller.dart';

class FeeReceiptTile extends StatelessWidget {
  final Welcome welcome;

  FeeReceiptTile(this.welcome);

  final FeeController feeController = Get.find<FeeController>();
  final String now = DateFormat().add_yMMMMEEEEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Text(
                        now,
                        style: TextStyle(
                            // color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$  ${welcome.price}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icon(
                          Icons.receipt,
                          size: 15,
                          color: Colors.grey,
                        ),
                        text: "  ${welcome.id.toString()}"),
                    SizedBox(
                      height: 5,
                    ),
                    IconWithText(
                        icon: Icon(
                          Icons.food_bank,
                          size: 15,
                          color: Colors.grey,
                        ),
                        text: "  ${welcome.rating.toString()}"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Total Paid : ${welcome.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        feeController.onReceivedProgress();
                        feeController.download(welcome.imageLink!, welcome.name!);
                      },
                      icon: Icon(
                        Icons.download,
                        color: Colors.purple,
                      ),
                      label: Text(
                        "Download Receipt",
                        style: TextStyle(color: Colors.purple),
                      ),
                      color: Colors.deepPurple[100],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
