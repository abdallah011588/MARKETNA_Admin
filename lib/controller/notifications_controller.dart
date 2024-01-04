

import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/data_source/notification_data.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController
{
  NotificationData notificationData  = NotificationData(Get.find());
  late RequestStatus requestStatus ;
  MyServices myServices =Get.find();

  List<NotificationModel> notificationModel =[];

  getAllNotification()async{

    requestStatus = RequestStatus.loading;
    var response  = await notificationData.getData();
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
      {
        if(response['status']=="success")
          {
            List data =response['data'];
            notificationModel.addAll(data.map((e) => NotificationModel.fromJson(e)));
            print(data);
          }
        else
          {
            requestStatus = RequestStatus.failure;
          }
      }
    update();

  }

  deleteNotification(NotificationModel notification)async{
    var response  = await notificationData.deleteData(notification.notificationUserId! ,notification.notificationBody!);
    if(response['status']=="success")
    {
      // List data =response['data'];
      // notificationModel.addAll(data.map((e) => NotificationModel.fromJson(e)));
      // print(data);
      notificationModel.removeWhere((element){
        return element.notificationBody==notification.notificationBody;
      });
    }
    update();

  }

  deleteAllNotification()async{
    if(notificationModel.isNotEmpty)
      {
        var response  = await notificationData.deleteAllData(myServices.shared!.getString("id")!);
        print(response);
        if(response['status']=="success")
        {
          notificationModel=[];
          print("response");

        }
        update();
      }

  }

  @override
  void onInit() {
    getAllNotification();
    super.onInit();
  }

}
