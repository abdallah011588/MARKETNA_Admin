

import 'dart:io';

import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/data/data_source/remote/categories_data.dart';
import 'package:admin/data/data_source/remote/products_data.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class AddProductController extends GetxController
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

  late TextEditingController dropDownNameController;

  List<SelectedListItem> dropDownList=[];

  String? category_id;
  ProductsData productsData = ProductsData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  addProduct()async
  {
    var formData = formKey.currentState;

    if (formData!.validate()) {
      if(file !=null){
        requestStatus =RequestStatus.loading;
        update();
        print("***************** ${basename(file!.path).toString()}");
        var response=await productsData.addProduct(
          productNameController.text,
          productNameArController.text,
          productDescriptionController.text,
          productDescriptionArController.text,
          productCountController.text,
          "1",
          productPriceController.text,
          productDiscountController.text,
          category_id!,
          basename(file!.path).toString(),
           file!,
        );
        requestStatus =handlingData(response);
        if(requestStatus==RequestStatus.success)
        {
          if(response['status']=="success")
          {
            Get.snackbar("Success".tr, "Product".tr+" ${productNameController.text} "+"add successfully".tr);
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
        Get.snackbar("Warning".tr, "Please add Product image".tr);
      }

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


  getCategories()async
  {
    CategoriesData categoriesData =CategoriesData(Get.find());
    List<CategoryModel> categories=[];


    requestStatus =RequestStatus.loading;
    update();
    var response= await categoriesData.viewCategories();
    requestStatus =handlingData(response);
    if(requestStatus==RequestStatus.success)
    {
      if(response['status']=="success")
      {
        categories=[];
        List dataList =response['data'];
        categories.addAll(dataList.map((e) => CategoryModel.fromJson(e)));
        for(int i =0 ;i<categories.length ; i++)
          {
            dropDownList.add(SelectedListItem(name: categories[i].categoryName!,value: categories[i].categoryId));
          }
      }
      else
      {
        requestStatus =RequestStatus.failure;
      }
    }
    update();
  }



  @override
  void onInit() {
    category_id=Get.arguments['categoryId'];
    productNameController=TextEditingController();
    productNameArController =TextEditingController();
    productDescriptionController =TextEditingController();
    productDescriptionArController =TextEditingController();
    productCountController =TextEditingController();
    productDiscountController =TextEditingController();
    productPriceController =TextEditingController();

    dropDownNameController =TextEditingController();
    getCategories();
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
    dropDownNameController.dispose();
    super.dispose();
  }
}