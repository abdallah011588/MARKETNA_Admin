

import 'dart:io';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/data/data_source/remote/categories_data.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class EditCategoryController extends GetxController
{
  late RequestStatus requestStatus;
  File? file;
  late TextEditingController categoryNameController;
  late TextEditingController categoryNameArController;
  CategoriesData categoriesData=CategoriesData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CategoryModel? categoryModel;
  String? imageUrl;

  editCategory(CategoryModel categoryModel)async
  {
    var formData = formKey.currentState;

    if (formData!.validate()) {
        requestStatus =RequestStatus.loading;
        update();
        var response;
        if(file !=null) {
           response = await categoriesData.editCategory(
             categoryModel.categoryId!,
            categoryNameController.text,
            categoryNameArController.text,
            basename(file!.path).toString(),
            file!,
          );
        }
        else{
          response = await categoriesData.editCategory(
            categoryModel.categoryId!,
            categoryNameController.text,
            categoryNameArController.text,
            "",
            file,
          );
        }

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
            Get.snackbar("Success".tr, "Category".tr+" ${categoryNameController.text} " +"edited successfully".tr);
            Get.offAllNamed(AppRoutes.homePage);
          }
          else
          {
            Get.snackbar("Failure".tr, "Something went wrong".tr);
          }
        }
        update();

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
    categoryModel=Get.arguments['categoryModel'];
    imageUrl = categoryModel!.categoryImage;
    categoryNameArController=TextEditingController(text: categoryModel!.categoryNameAr);
    categoryNameController =TextEditingController(text: categoryModel!.categoryName);
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