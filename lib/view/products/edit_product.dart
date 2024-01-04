import 'package:admin/controller/products/edit_product_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/functions/validator.dart';
import 'package:admin/link_api.dart';
import 'package:admin/view/widgets/appbar.dart';
import 'package:admin/view/widgets/auth/custom_button_auth.dart';
import 'package:admin/view/widgets/auth/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProductController());
    return GetBuilder<EditProductController>(
      builder: (controller) =>  Scaffold(
        appBar: customAppBar("Edit Product".tr),
        body: HandlingDataView(requestStatus: controller.requestStatus, widget:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Text(
                  "Edit Product".tr,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product english name".tr,
                  hint: "product name".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productNameController,
                  valid: (val){
                    return validInput(val!, 3, 50, "");
                  },
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product arabic name".tr,
                  hint: "product name".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productNameArController,
                  valid: (val){
                    return validInput(val!, 3, 50, "");
                  },
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product english description".tr,
                  hint: "product description".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productDescriptionController,
                  valid: (val){
                    return validInput(val!, 20, 250, "");
                  },
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product arabic description".tr,
                  hint: "product description".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productDescriptionArController,
                  valid: (val){
                    return validInput(val!, 20, 250, "");
                  },
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product count".tr,
                  hint: "product count".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productCountController,
                  valid: (val){
                    return validInput(val!, 1, 10, "");
                  },
                  keyBoardType: TextInputType.number,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product discount".tr,
                  hint: "product discount".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productDiscountController,
                  valid: (val){
                    return validInput(val!, 1, 3, "");
                  },
                  keyBoardType: TextInputType.number,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "product price".tr,
                  hint: "product price".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.productPriceController,
                  valid: (val){
                    return validInput(val!, 2, 50, "");
                  },
                  keyBoardType: TextInputType.number,
                ),

                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    controller.chooseFile();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGery3,
                      border: Border.all(color: AppColors.black,width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 170,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:controller.file ==null?
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(child: Image.network(AppLink.productImage+ controller.imageUrl!)),
                        IconButton(
                          onPressed: (){
                            controller.chooseFile();
                          },
                          icon: SvgPicture.asset(AppImageAsset.close,height: 50,),splashRadius: 10,
                        ),
                      ],
                    ):
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(child: Image.file(controller.file!,)),
                        IconButton(
                          onPressed: (){
                            controller.clearFile();
                          },
                          icon: SvgPicture.asset(AppImageAsset.close,height: 50,),splashRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20,),
              ],
            ),
          ),
        ) ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomButtonAuth(onPressed: (){
            controller.editProduct(controller.productModel!);
          },
            text: "Edit".tr,
          ),
        ),
      ),
    );
  }
}
