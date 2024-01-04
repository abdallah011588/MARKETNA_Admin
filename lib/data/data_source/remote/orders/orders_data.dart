
import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';

class OrdersData
{
  CRUD crud;
  OrdersData(this.crud);

  getPendingData()async
  {
    var response = await crud.postData( AppLink.pending , {});
    return response.fold((l) => l, (r) => r);
  }


  getAcceptedData()async
  {
    var response = await crud.postData( AppLink.accepted , {});
    return response.fold((l) => l, (r) => r);
  }


  getArchivedData()async
  {
    var response = await crud.postData( AppLink.archived , {});
    return response.fold((l) => l, (r) => r);
  }



  approveOrderData(String userId , String orderId)async
  {
    var response = await crud.postData( AppLink.approve , {
          "user_id":userId,
          "order_id":orderId,
    },
    );
    return response.fold((l) => l, (r) => r);
  }

  prepareOrderData(String userId , String orderId ,String orderType)async
  {
    var response = await crud.postData( AppLink.prepare , {
      "user_id":userId,
      "order_id":orderId,
      "order_type":orderType,
    },
    );
    return response.fold((l) => l, (r) => r);
  }




  /*
  deleteData(String orderId)async
  {
    var response = await crud.postData( AppLink.deleteOrder , {"order_id":orderId,});
    return response.fold((l) => l, (r) => r);
  }
  */

  /*
  ratingData(String userId ,String orderId ,double rating ,String feedback)async
  {
    var response = await crud.postData( AppLink.rating , {
      "user_id":userId,
      "order_id":orderId,
      "order_rating":rating.toString(),
      "order_rating_feedback":feedback,
    });
    return response.fold((l) => l, (r) => r);
  }
  */

}