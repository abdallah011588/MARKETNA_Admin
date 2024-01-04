
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{

  MyServices myServices =Get.find();

  logOut() {
    myServices.shared!.setBool("isLogin", false).then((value) {
      Get.offAllNamed(AppRoutes.login);
    });
  }

}