

import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';

class NotificationData
{
  CRUD crud;
  NotificationData(this.crud);

  getData()async
  {
    var response = await crud.postData( AppLink.notification , {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String notificationUserId , String notificationBody)async
  {
    var response = await crud.postData( AppLink.deleteNotification , {"userId": notificationUserId,"body":notificationBody});
    return response.fold((l) => l, (r) => r);
  }

  deleteAllData(String notificationUserId )async
  {
    var response = await crud.postData(
        AppLink.deleteAllNotification ,
        {"userId": notificationUserId});
    return response.fold((l) => l, (r) => r);
  }

}