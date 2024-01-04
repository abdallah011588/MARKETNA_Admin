

import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/view/categories/view.dart';
import 'package:admin/view/orders/archived.dart';
import 'package:admin/view/orders/orders.dart';
import 'package:admin/view/products/products_screen.dart';
import 'package:admin/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainHomePageController extends GetxController
{
  changePage(int index);
  changeColor(int index);
  changeTitle(int index);
  goToAddPage();
  goToNotificationPage();
}

class MainHomePageControllerImp extends MainHomePageController
{
  MyServices myServices =Get.find();


  int currentPage=0;

  List<Widget> pages=[
   const ViewCategories(),
    const ProductsScreen(),
    const Orders(),
    const SettingsScreen(),
  ];

  logOut() {
    myServices.shared!.setBool("isLogin", false).then((value) {
      Get.offAllNamed(AppRoutes.login);
    });
  }


  List<String> pageIcon=[
    AppImageAsset.pending,
    AppImageAsset.accepted,
    AppImageAsset.done,
    AppImageAsset.settings,
  ];

  List<String> pageTitle=[
    "New Orders",
    "Accepted Orders",
    "Delivered Orders",
    "Settings",
    ];

  @override
  changePage(int index) {
    currentPage=index;
    update();
  }

  @override
  changeTitle(int index) {
    currentPage=index;
    update();
  }

  @override
  Color changeColor(int index) {
    if(currentPage==index)
      {
        return AppColors.primaryColor;
      }
    else
      {
        return AppColors.black;
      }
  }

  @override
  goToAddPage() {
    if(currentPage ==0)
      {
        Get.toNamed(AppRoutes.categoriesAdd);
      }
   else if(currentPage ==1)
    {
      Get.toNamed(AppRoutes.productsAdd);
    }

  }

  @override
  goToNotificationPage() {

    Get.toNamed(AppRoutes.notification);

  }

}