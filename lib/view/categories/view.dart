import 'package:admin/controller/categories/view_categories_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/functions/translate_database.dart';
import 'package:admin/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryViewController());
    return GetBuilder<CategoryViewController>(
        builder: (controller) {
          return HandlingDataView(requestStatus: controller.requestStatus, widget: ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                color: AppColors.lightGery3,
                elevation: 2,
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(translateDatabase( controller.categories[index].categoryNameAr! , controller.categories[index].categoryName!,)),
                  subtitle: Text(controller.categories[index].categoryDatetime!,style: TextStyle(fontSize: 14),),
                  leading: Container(
                    height: 80,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor3,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),

                    child: SvgPicture.network(AppLink.categoryImage+ controller.categories[index].categoryImage!,color: AppColors.primaryColor0,),
                  ),
                  trailing: DropdownButton(
                      underline:const SizedBox(),
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                          onTap: (){
                          },
                          value: 'Delete',
                          child: Text(
                            'Delete'.tr,
                            style:const TextStyle(color: Colors.black,),
                          ),
                        ),
                        DropdownMenuItem(
                          onTap: (){
                          },
                          value: 'Edit',
                          child: Text(
                            'Edit'.tr,
                            style:const TextStyle(color: Colors.black,),
                          ),
                        ),
                      ],
                      onChanged: (value){
                        if(value=="Edit")
                          {
                            controller.goToEdit(controller.categories[index]);
                          }
                        if(value=="Delete")
                          {
                            Get.defaultDialog(
                              title: "Warning".tr,
                              middleText: "Do you want to delete this category ?".tr,
                              onConfirm: (){
                                controller.deleteCategory(controller.categories[index].categoryId!);
                                Get.back();
                              },
                              onCancel: (){
                                Get.back();
                              },
                              confirmTextColor: AppColors.white,
                            );
                          }
                      }
                  ),
                ),
              ),
            ),));
        }
    );
  }
}
