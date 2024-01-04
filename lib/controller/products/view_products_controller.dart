

import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/data/data_source/remote/products_data.dart';
import 'package:admin/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductViewController extends GetxController
{
  late RequestStatus requestStatus;
  List<ProductModel> products=[];
  ProductsData productsData =ProductsData(Get.find());
  String? category_id;
  getAllProducts()async
  {
    requestStatus =RequestStatus.loading;
    update();
    var response= await productsData.viewProducts(category_id!);
    requestStatus =handlingData(response);
    if(requestStatus==RequestStatus.success)
      {
        if(response['status']=="success")
          {
            products=[];
            print(response['data']);
            List dataList =response['data'];
             products.addAll(dataList.map((e) => ProductModel.fromJson(e)));
          }
        else
          {
            requestStatus =RequestStatus.failure;
          }
      }
    update();
  }


  deleteProduct(String productId )async
  {
    requestStatus =RequestStatus.loading;
    update();
    var response= await productsData.deleteProduct(productId);
    requestStatus =handlingData(response);
    if(requestStatus==RequestStatus.success)
    {
      if(response['status']=="success")
      {
        //getAllCategories();
        products.removeWhere((element) => element.productId==productId);
        Get.snackbar("Success".tr, "Product deleted successfully".tr);
      }
      else
      {
        Get.snackbar("Failure".tr, "Something went wrong".tr);
      }
    }
    update();
  }

  goToEdit(ProductModel productModel)
  {
     Get.toNamed(AppRoutes.productsEdit,arguments: {"productModel":productModel});
  }

  goToAddProduct()
  {
    Get.toNamed(AppRoutes.productsAdd,arguments: {"categoryId":category_id});
  }

  @override
  void onInit() {
    category_id=Get.arguments['categoryId'];
    getAllProducts();
    super.onInit();
  }
  
}