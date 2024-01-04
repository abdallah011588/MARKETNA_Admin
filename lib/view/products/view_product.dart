import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/functions/translate_database.dart';
import 'package:admin/link_api.dart';
import 'package:admin/view/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewProducts extends StatelessWidget {
  const ViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductViewController());
    return GetBuilder<ProductViewController>(
      builder: (controller) => Scaffold(
        appBar: customAppBar("Products".tr),
        body: HandlingDataView(requestStatus: controller.requestStatus, widget: Center(
          child:  NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.68),
              itemBuilder: (context , index){
                return InkWell(
                  onTap: () {},
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: "${controller.products[index].productId}",
                            child: CachedNetworkImage(
                              imageUrl:
                              AppLink.productImage + "/" + controller.products[index].productImage!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            translateDatabase(
                                controller.products[index].productNameAr!,  controller.products[index].productName!),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: AppColors.black,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              translateDatabase(controller.products[index].productDescriptionAr!,
                                  controller.products[index].productDescription!),
                              style: const TextStyle(fontSize: 15, height: 1.5),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Price".tr+":"+controller.products[index].productPrice!.toString()+"\$",
                                  style: const TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.primaryColor,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              DropdownButton(
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
                                      controller.goToEdit(controller.products[index]);
                                    }
                                    if(value=="Delete")
                                    {
                                      Get.defaultDialog(
                                        title: "Warning".tr,
                                        middleText: "Do you want to delete this product ?".tr,
                                        onConfirm: (){
                                          controller.deleteProduct(controller.products[index].productId!);
                                          Get.back();
                                        },
                                        onCancel: (){
                                          //Get.back();
                                        },
                                        confirmTextColor: AppColors.white,
                                      );
                                    }
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount:controller.products.length,
            ),
          ),
        )),
        floatingActionButton: FloatingActionButton(onPressed: (){
          controller.goToAddProduct();
        },
          child:SvgPicture.asset(
            AppImageAsset.add,
            color: AppColors.lightGery2,
          ),
          backgroundColor: AppColors.primaryColor, ),
      ),
    );
  }
}
