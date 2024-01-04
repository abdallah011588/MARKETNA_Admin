import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';

class CategoriesData {
  CRUD crud;

  CategoriesData(this.crud);

  viewCategories() async {
    var response = await crud.postData(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  // addCategory(String categoryName ,String categoryNameAr ,String categoryImage )async
  // {
  //   var response=await crud.postData(AppLink.categoriesAdd, {
  //     "category_name": categoryName,
  //     "category_name_ar": categoryNameAr,
  //     "category_image": categoryImage,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  addCategory(String categoryName, String categoryNameAr, String categoryImage,
      File file) async {
    var response = await crud.postRequestWithOneFile(
      AppLink.categoriesAdd,
      {
        "category_name": categoryName,
        "category_name_ar": categoryNameAr,
        "category_image": categoryImage,
      },
      "category_image",
      file,
    );
    return response.fold((l) => l, (r) => r);
  }

  editCategory(
      String categoryId,
      String categoryName,
      String categoryNameAr,
      String categoryImage,
      [File? file] ) async
  {
    var response;
    if(file==null){
      response =await crud.postData(
      AppLink.categoriesEdit,
      {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_name_ar": categoryNameAr,
      },
      );
    }
    else
    {
        response = await crud.postRequestWithOneFile(
          AppLink.categoriesEdit,
          {
            "category_id": categoryId,
            "category_name": categoryName,
            "category_name_ar": categoryNameAr,
            "category_image": categoryImage,
          },
          "category_image",
          file,
        );
      }

    return response.fold((l) => l, (r) => r);
  }

  // editCategory(String categoryId , String categoryName ,String categoryNameAr ,String categoryImage,String categoryOldImage)async
  // {
  //   var response=await crud.postData(AppLink.categoriesEdit, {
  //     "category_id": categoryId,
  //     "category_name": categoryName,
  //     "category_name_ar": categoryNameAr,
  //     "category_image": categoryImage,
  //     "category_old_image": categoryOldImage,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  deleteCategory(String categoryId, /*String categoryOldImage */) async {
    var response = await crud.postData(AppLink.categoriesDelete, {
      "category_id": categoryId,
      // "image_name": categoryOldImage,
    });
    return response.fold((l) => l, (r) => r);
  }
}
