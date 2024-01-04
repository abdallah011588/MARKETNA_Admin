import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {

  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {

    if (myServices.shared!.getBool("isLogin") !=null && myServices.shared!.getBool("isLogin") == true) {
      return const RouteSettings(name: AppRoutes.homePage);
    }

    if (myServices.shared!.getBool("language") !=null && myServices.shared!.getBool("language") == true) {
      return const RouteSettings(name: AppRoutes.login);
    }

    return null;

  }

}
