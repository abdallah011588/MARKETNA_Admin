import 'package:admin/controller/notifications_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constant/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(NotificationsController());
    return GetBuilder<NotificationsController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Notifications".tr,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
              leading: GestureDetector(
                child: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
                onTap: (){
                  Get.back();
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(onPressed:(){
                    controller.deleteAllNotification();
                  } , child: Text(
                    "Delete all".tr,
                    style: TextStyle(color: AppColors.primaryColor,fontSize: 17),
                  )),
                )
              ],
            ),
            body:HandlingDataView(
              requestStatus: controller.requestStatus,
              widget: Padding(
                padding: const EdgeInsets.all(10.0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: controller.notificationModel.length,
                    itemBuilder: (context, index) => ListTile(
                      // minVerticalPadding: 15,
                      style: ListTileStyle.drawer,
                      title: Row(
                        children: [
                          Text(
                            controller.notificationModel[index].notificationTitle!,
                            style: TextStyle(color: AppColors.black),
                          ),
                          Spacer(),
                          Text(
                            Jiffy(controller.notificationModel[index].notificationDateTime!,"yyyy-MM-dd h:mm:ss").fromNow(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        controller.notificationModel[index].notificationBody!,
                        style: TextStyle(color: AppColors.black,fontSize: 15),
                      ),
// trailing: Text(
//   Jiffy(controller.notificationModel[index].notificationDateTime!,"yyyy-MM-dd h:mm:ss").fromNow(),
//   style: TextStyle(fontSize: 15),
// ),
                      trailing: IconButton(onPressed: (){
                        controller.deleteNotification(controller.notificationModel[index]);
                      }, icon: Icon(Icons.delete_outline)),
                    ),

                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
