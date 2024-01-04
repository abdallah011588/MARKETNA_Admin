
import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';

class OrderDetailsData
{
  CRUD crud;
  OrderDetailsData(this.crud);

  getData(String orderId)async
  {
    var response = await crud.postData( AppLink.details , {
      "order_id":orderId,
    });
    return response.fold((l) => l, (r) => r);
  }

}