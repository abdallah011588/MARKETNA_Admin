
import 'package:admin/controller/orders/order_details_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/view/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar:customAppBar("Order Details".tr),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) {
          return HandlingDataView(requestStatus: controller.requestStatus, widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow(
                              children: [
                                Text("Product".tr,textAlign: TextAlign.center,style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                Text("Quantity".tr,textAlign: TextAlign.center,style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                Text("Price".tr,textAlign: TextAlign.center,style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                              ]
                          ),
                          ...List.generate(controller.data.length, (index) =>
                              TableRow(
                                  children: [
                                    Text(controller.data[index]["product_name"] ,textAlign: TextAlign.center,),
                                    Text(controller.data[index]["count_products"].toString(),textAlign: TextAlign.center,),
                                    Text(controller.data[index]["product_price"].toString(),textAlign: TextAlign.center,),
                                  ]
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Total price".tr + " :${controller.orderModel!.orderTotalPrice}\$",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                if(controller.orderModel!.orderType =="0")  Card(
                  child: ListTile(
                    title: Text(controller.orderModel!.addressName!),
                    subtitle: Text(controller.orderModel!.addressCity! + " - " + controller.orderModel!.addressStreet!),
                  ),
                ),
                SizedBox(height: 20,),
                if(controller.orderModel!.orderType =="0") Card(
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: controller.cameraPosition!,
                      markers: controller.markers,
                      onMapCreated: (GoogleMapController googleMapController){
                        controller.mapController.complete(googleMapController);
                      },

                      gestureRecognizers: {
                        Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer(),),
                      },
                    ),
                  ),
                ),
              ],
            ),
          ));
        }
      ),
    );
  }
}



/*

   Get.put(PendingController());
    return GetBuilder<PendingController>(builder: (controller) => HandlingDataView(
        requestStatus: controller.requestStatus,
        widget: ListView.builder(
          itemBuilder: (context, index) {
          return PendingCard(orderModel: controller.orders[index]);
        },
          itemCount: controller.orders.length,
        ),
    ),);

 */