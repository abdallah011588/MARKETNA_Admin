

import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/data/data_source/remote/categories_data.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:get/get.dart';

class CategoryViewController extends GetxController
{
  late RequestStatus requestStatus;
  List<CategoryModel> categories=[];
  CategoriesData categoriesData =CategoriesData(Get.find());

  getAllCategories()async
  {
    requestStatus =RequestStatus.loading;
    update();
    var response= await categoriesData.viewCategories();
    requestStatus =handlingData(response);
    if(requestStatus==RequestStatus.success)
      {
        if(response['status']=="success")
          {
            categories=[];
            print(response['data']);
            List dataList =response['data'];
             categories.addAll(dataList.map((e) => CategoryModel.fromJson(e)));
          }
        else
          {
            requestStatus =RequestStatus.failure;
          }
      }
    update();
  }


  deleteCategory(String categoryId)async
  {
    requestStatus =RequestStatus.loading;
    update();
    var response= await categoriesData.deleteCategory(categoryId);
    requestStatus =handlingData(response);
    if(requestStatus==RequestStatus.success)
    {
      if(response['status']=="success")
      {
        //getAllCategories();
        categories.removeWhere((element) => element.categoryId==categoryId);
        Get.snackbar("Success".tr, "Category deleted successfully".tr);
      }
      else
      {
        Get.snackbar("Failure".tr, "Something went wrong".tr);
      }
    }
    update();
  }

  goToEdit(CategoryModel categoryModel)
  {
     Get.toNamed(AppRoutes.categoriesEdit,arguments: {"categoryModel":categoryModel});
  }

  goToProducts(String categoryId)
  {
    Get.toNamed(AppRoutes.productsView ,arguments: {"categoryId":categoryId});
  }


  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }
  
}