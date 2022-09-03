import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../my_drawer.dart';
import 'fee_controller.dart';
import 'fee_receipt_tile.dart';

class FeeReceiptScreen extends StatelessWidget {
  static final String id = '/FeeReceiptScreen';

  // String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
 final FeeController feeController = Get.put(FeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Fee Receipts",),

        ),
        body: GetX<FeeController>(
          init: FeeController(),
          builder: (feeController) => feeController.loading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: feeController.listData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: FeeReceiptTile(feeController.listData[index]),
                    );
                  },
                ),
        ));
  }
}
