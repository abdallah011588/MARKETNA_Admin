
import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';
import 'package:path/path.dart';

class ProductsData
{
  CRUD crud;
  ProductsData(this.crud);

  viewProducts(String categoryId)async
  {
    var response=await crud.postData(AppLink.productsView, {"category_id":categoryId});
    return response.fold((l) => l, (r) => r);
  }


  addProduct(
      String productName ,
      String productNameAr ,
      String productDescription,
      String productDescriptionAr,
      String productCount,
      String productActive,
      String productPrice,
      String productDiscount,
      String productCategory,
      String productImage,
      File  file,
      )async {
    var response=await crud.postRequestWithOneFile(
          AppLink.productsAdd,
          {
          "product_name":productName,
          "product_name_ar":productNameAr,
          "product_description":productDescription,
          "product_description_ar":productDescriptionAr,
          "product_count":productCount,
          "product_active":productActive,
          "product_price":productPrice,
          "product_discount":productDiscount,
          "product_category":productCategory,
          "product_image":basename(file.path).toString(),
        },
      "product_image",
          file,
        );



    return response.fold((l) => l, (r) => r);
  }



  editProduct(
      String productId ,
      String productName ,
      String productNameAr ,
      String productDescription,
      String productDescriptionAr,
      String productCount,
      String productActive,
      String productPrice,
      String productDiscount,
      String productCategory,
      String productImage,
      [File ? file]
      )async {
    var response;
    if(file ==null)
      {
        response = await crud.postData(AppLink.productsEdit, {
          "product_id":productId,
          "product_name":productName,
          "product_name_ar":productNameAr,
          "product_description":productDescription,
          "product_description_ar":productDescriptionAr,
          "product_count":productCount,
          "product_active":productActive,
          "product_price":productPrice,
          "product_discount":productDiscount,
          "product_category":productCategory,
          "product_image":productImage,
        });
      }
    else
      {
        response = await crud.postRequestWithOneFile(
          AppLink.productsEdit,
            {
          "product_id":productId,
          "product_name":productName,
          "product_name_ar":productNameAr,
          "product_description":productDescription,
          "product_description_ar":productDescriptionAr,
          "product_count":productCount,
          "product_active":productActive,
          "product_price":productPrice,
          "product_discount":productDiscount,
          "product_category":productCategory,
          "product_image":productImage,
        },
          "product_image",
          file,
        );
      }
    return response.fold((l) => l, (r) => r);
  }



  deleteProduct(String productId )async
  {
    var response=await crud.postData(AppLink.productsDelete, {
      "product_id": productId,
    });
    return response.fold((l) => l, (r) => r);
  }


}