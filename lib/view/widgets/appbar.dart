import 'package:admin/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(String title,)
{
  return  AppBar(
    title:  Text(title,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 25,
      ),
    ),
    centerTitle: true,
    leading: GestureDetector(
      child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
      onTap: (){
        Get.back();
      },
    ),
  );
}