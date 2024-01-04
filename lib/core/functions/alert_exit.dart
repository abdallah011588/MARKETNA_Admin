import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "Alert".tr,
    middleText: "Do you want to exit the app".tr,
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("Yes".tr),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Close".tr),
      ),
    ],
  );
  return Future.value(true);
}
