import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: ListView(
      children: [
        InkWell(
          onTap: (){
            Get.toNamed(AppRoutes.pending);
          },
          child: Card(
            elevation: 5,
            child: Container(
              color: AppColors.lightGery3,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImageAsset.pending,height: 100,color: AppColors.primaryColor),
                  Text("Pending".tr,style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        InkWell(
          onTap: (){Get.toNamed(AppRoutes.accepted);},
          child: Card(
            elevation: 5,
            child: Container(
              color: AppColors.lightGery3,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImageAsset.accepted,height: 100,color: AppColors.primaryColor),
                  Text("Accepted".tr,style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        InkWell(
          onTap: (){Get.toNamed(AppRoutes.archived);},
          child: Card(
            elevation: 5,
            child: Container(
              color: AppColors.lightGery3,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImageAsset.done,height: 100,color: AppColors.primaryColor),
                  Text("Archived".tr,style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
      ],
    ),);
  }
}
