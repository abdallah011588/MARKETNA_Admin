import 'package:admin/controller/categories/edit_category_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/functions/validator.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:admin/link_api.dart';
import 'package:admin/view/widgets/appbar.dart';
import 'package:admin/view/widgets/auth/custom_button_auth.dart';
import 'package:admin/view/widgets/auth/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditCategory extends StatelessWidget {
 const EditCategory({ Key? key ,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoryController());
    return GetBuilder<EditCategoryController>(
      builder: (controller) =>  Scaffold(
        appBar: customAppBar("Edit Category".tr),
        body: HandlingDataView(requestStatus: controller.requestStatus, widget:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Text(
                  "Edit Category".tr,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "category english name".tr,
                  hint: "category name".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.categoryNameController,
                  valid: (val){
                    return validInput(val!, 3, 50, "");
                  },
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: 20,),
                CustomTextFormField(
                  borderRadius: 20,
                  label: "category arabic name".tr,
                  hint: "category name".tr,
                  suffixIcon: Icons.drive_file_rename_outline,
                  controller: controller.categoryNameArController,
                  valid: (val){
                    return validInput(val!, 3, 50, "");
                  },
                  keyBoardType: TextInputType.text,
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
                    child: controller.file ==null?
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(child: SvgPicture.network(AppLink.categoryImage + controller.imageUrl!,)),
                        IconButton(
                          onPressed: (){
                            controller.chooseFile();
                            //controller.imageUrl="";
                          },
                          icon: SvgPicture.asset(AppImageAsset.close,height: 50,),splashRadius: 10,),
                      ],
                    ):
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(child: SvgPicture.file(controller.file!,)),
                        IconButton(
                          onPressed: (){
                            controller.clearFile();
                          },
                          icon: SvgPicture.asset(AppImageAsset.close,height: 50,),splashRadius: 10,),
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
            controller.editCategory( controller.categoryModel!);
          },
            text: "Edit".tr,
          ),
        ),
      ),
    );
  }

}
