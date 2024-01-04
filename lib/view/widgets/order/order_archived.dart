
import 'dart:ui';

import 'package:admin/controller/orders/archived_controller.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:admin/view/widgets/auth/custom_button_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ArchivedCard extends GetView<ArchivedController> {
  final OrderModel orderModel;
  const ArchivedCard( {Key? key ,required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 5,
        color: AppColors.lightGery3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Number".tr + " : ${orderModel.orderId}",
                        style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColors.primaryColor),
                    ),
                  ),
                  Text(Jiffy(orderModel.orderDatetime,"yyyy-MM-dd h:mm:ss").fromNow(),),
                  SizedBox(
                    child: DropdownButton(
                        underline:const SizedBox(),
                        icon: Icon(
                          Icons.more_vert,
                          color: AppColors.black,
                        ),
                        items: [
                          DropdownMenuItem(
                            onTap: (){
                             // controller.deleteOrder(orderModel.orderId!,orderModel.orderStatus!);
                            },
                            value: 'Delete',
                            child: Text(
                              'Delete'.tr,
                              style:const TextStyle(color: Colors.black,),
                            ),
                          ),
                        ],
                        onChanged: (value){
                        }
                    ),
                  ),
                ],
              ),
              const Divider(),
              Text("Order Type".tr + " : ${controller.getOrderType( orderModel.orderType!)}",style:const TextStyle(color: Colors.black,),),
              Text("Order Price".tr + " : ${orderModel.orderPrice}\$",style:const TextStyle(color: Colors.black,),),
              Text("Delivery Price".tr + " : ${orderModel.orderDeliveryPrice}\$",style:const TextStyle(color: Colors.black,),),
              Text("Payment Method".tr + " : ${controller.getPaymentType(orderModel.orderPaymentMethod!)}",style:const TextStyle(color: Colors.black,),),
              Text("Order Status".tr + " : ${controller.getOrderStatus(orderModel.orderStatus!)}",style:const TextStyle(color: Colors.black,),),
              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total price".tr+" : ${orderModel.orderTotalPrice}\$",
                      style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)
                  ),
                  SizedBox(height:40 ,child: CustomButtonAuth(onPressed: (){
                    controller.goToOrderDetails(orderModel);
                  }, text: "Details".tr)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
