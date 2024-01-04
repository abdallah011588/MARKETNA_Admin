
import 'package:admin/controller/orders/archived_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/view/widgets/appbar.dart';
import 'package:admin/view/widgets/order/order_archived.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Archived extends StatelessWidget {
  const Archived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ArchivedController());
    return Scaffold(
      appBar: customAppBar("Archived orders".tr),
      body: GetBuilder<ArchivedController>(builder: (controller) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: RefreshIndicator(
          onRefresh: (){
            return controller.getData();
          },
          child: Stack(
            children: [
              HandlingDataView(
                requestStatus: controller.requestStatus,
                widget: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll){
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ArchivedCard(orderModel: controller.orders[index]);
                    },
                    itemCount: controller.orders.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}

