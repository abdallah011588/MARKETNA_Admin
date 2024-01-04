

import 'dart:io';

import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/data/data_source/remote/categories_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class AddCategoryController extends GetxController
{
  late RequestStatus requestStatus;
  File? file;
  late TextEditingController categoryNameController;
  late TextEditingController categoryNameArController;


  CategoriesData categoriesData=CategoriesData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addCategory()async
  {
    var formData = formKey.currentState;

    if (formData!.validate()) {
      if(file !=null){
        requestStatus =RequestStatus.loading;
        update();
        var response=await categoriesData.addCategory(
          categoryNameController.text,
          categoryNameArController.text,
          basename(file!.path).toString(),
          file!,
        );
        requestStatus =handlingData(response);
        if(requestStatus==RequestStatus.success)
        {
          if(response['status']=="success")
          {
            /*
              CategoryViewController viewController=Get.put(CategoryViewController());
            viewController.getAllCategories();
            Get.back();
             */
            Get.snackbar("Success".tr, "Category".tr+" ${categoryNameController.text} "+ "added successfully".tr);
            Get.offAllNamed(AppRoutes.homePage);
          }
          else
          {
            Get.snackbar("Failure".tr, "Something went wrong".tr);
          }
        }
        update();
      }
      else {
        Get.snackbar("Warning".tr, "Please add category image".tr);
      }

    } else {}



  }

  chooseFile()async
  {
    file= await uploadFileGallery(true);
    update();
  }

  clearFile()
  {
    file=null;
    update();
  }


  @override
  void onInit() {
    categoryNameArController=TextEditingController();
    categoryNameController =TextEditingController();
    requestStatus=RequestStatus.none;
    super.onInit();
  }

  @override
  void dispose() {
    categoryNameArController.dispose();
    categoryNameController.dispose();
    super.dispose();
  }
}