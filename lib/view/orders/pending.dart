
import 'package:admin/controller/orders/pending_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/view/widgets/appbar.dart';
import 'package:admin/view/widgets/order/order_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Pending extends StatelessWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Scaffold(
      appBar: customAppBar("Pending orders".tr),
      body: GetBuilder<PendingController>(builder: (controller) =>
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RefreshIndicator(

                child:  Stack(
                  children: [
                    HandlingDataView(
                      requestStatus: controller.requestStatus,
                      widget: NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll){
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child:  ListView.builder(
                          reverse: false,
                          itemBuilder: (context, index) {
                            return PendingCard(orderModel: controller.orders[index]);
                          },
                          itemCount: controller.orders.length,
                        ),
                      ),
                    ),
                  ],
                ),
                onRefresh: (){
                  return controller.getData();
                },
            ),
          ),

      ),
    );
  }
}



/*
Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order number : ${controller.orders[index].orderId}",
                            style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)),
                        Text("${Jiffy(controller.orders[index].orderDatetime,"yyyy-MM-dd h:mm:ss").fromNow()}",),
                      ],
                    ),
                    Divider(),
                    Text("Order Type : ${controller.getOrderType( controller.orders[index].orderType!)}",),
                    Text("Order Price : ${controller.orders[index].orderPrice}\$",),
                    Text("Delivery Price : ${controller.orders[index].orderDeliveryPrice}\$",),
                    Text("Payment method : ${controller.getPaymentType(controller.orders[index].orderPaymentMethod!)}",),
                    Text("Order Status : ${controller.getOrderStatus(controller.orders[index].orderStatus!)}",),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total price : ${controller.orders[index].orderTotalPrice}\$",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.primaryColor)),
                        Container(height:40 ,child: CustomButtonAuth(onPressed: (){}, text: "Details")),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )
 */