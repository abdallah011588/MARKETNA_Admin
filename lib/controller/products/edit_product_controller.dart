

import 'dart:io';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/data/data_source/remote/categories_data.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:admin/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:admin/data/data_source/remote/products_data.dart';

class EditProductController extends GetxController
{
  late RequestStatus requestStatus;
  File? file;
  late TextEditingController productNameController;
  late TextEditingController productNameArController;
  late TextEditingController productDescriptionController;
  late TextEditingController productDescriptionArController;
  late TextEditingController productCountController;
  late TextEditingController productDiscountController;
  late TextEditingController productPriceController;

  ProductsData productsData = ProductsData(Get.find());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProductModel? productModel;
  String? imageUrl;

  editProduct(ProductModel productModel)async
  {
    var formData = formKey.currentState;

    if (formData!.validate()) {
        requestStatus =RequestStatus.loading;
        update();
        var response;
        if(file !=null) {
           response = await productsData.editProduct(
             productModel.productId!,
             productNameController.text,
             productNameArController.text,
             productDescriptionController.text,
             productDescriptionArController.text,
             productCountController.text,
             "1",
             productPriceController.text,
             productDiscountController.text,
             productModel.productCategory!.toString(),
             basename(file!.path).toString(),
             file!,
           );
        }
        else{
          response = await productsData.editProduct(
            productModel.productId!,
            productNameController.text,
            productNameArController.text,
            productDescriptionController.text,
            productDescriptionArController.text,
            productCountController.text,
            "1",
            productPriceController.text,
            productDiscountController.text,
            productModel.productCategory!.toString(),
            "",
            file,
          );
        }

        requestStatus =handlingData(response);
        if(requestStatus==RequestStatus.success)
        {
          if(response['status']=="success")
          {
            //Get.back();
            Get.snackbar("Success".tr, "Product".tr+" ${productNameController.text} "+ "edit successfully".tr);
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
    showBottomMenu(chooseFileFromCamera, chooseFileFromGallery);
  }

  chooseFileFromCamera()async
  {
    file= await uploadImageCamera();
    update();
  }

  chooseFileFromGallery()async
  {
    file= await uploadFileGallery(false);
    update();
  }

  clearFile()
  {
    file=null;
    update();
  }


  @override
  void onInit() {
    productModel = Get.arguments['productModel'];
    imageUrl = productModel!.productImage;
    productNameController=TextEditingController(text: productModel!.productName);
    productNameArController =TextEditingController(text: productModel!.productNameAr);
    productDescriptionController =TextEditingController(text: productModel!.productDescription);
    productDescriptionArController =TextEditingController(text: productModel!.productDescriptionAr);
    productCountController =TextEditingController(text: productModel!.productCount.toString());
    productDiscountController =TextEditingController(text: productModel!.productDiscount.toString());
    productPriceController =TextEditingController(text: productModel!.productPrice.toString());
    requestStatus=RequestStatus.none;
    super.onInit();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productNameArController.dispose();
    productDescriptionController.dispose();
    productDescriptionArController.dispose();
    productCountController.dispose();
    productDiscountController.dispose();
    productPriceController.dispose();
    super.dispose();
  }
}