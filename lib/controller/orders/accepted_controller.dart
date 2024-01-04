
import 'package:admin/controller/orders/archived_controller.dart';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/data_source/remote/orders/orders_data.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:get/get.dart';

class AcceptedController extends GetxController
{
  OrdersData ordersData = OrdersData(Get.find());
  late RequestStatus requestStatus ;
  MyServices myServices=Get.find();
  List<OrderModel> orders=[];

  getData()async{
    requestStatus = RequestStatus.loading;
    update();
    var response  = await ordersData.getAcceptedData();
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
        if(response['status']=="success")
          {
            orders=[];
            List dataList=response['data'];
            orders.addAll(dataList.map((e) => OrderModel.fromJson(e)));
          }
        else
          {
            requestStatus = RequestStatus.failure;
          }
      }
    update();

  }

  prepareOrder(String userId , String orderId,String orderType)async{
    requestStatus = RequestStatus.loading;
    update();
    var response  = await ordersData.prepareOrderData( userId, orderId ,orderType);
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success)
    {
      if(response['status']=="success")
      {
        Get.snackbar("Information".tr, "Order".tr+" ${orderId} "+"Accepted successfully".tr);
        getData();
      }
      else
      {
        Get.snackbar("Warning".tr, "Something went wrong".tr);
        requestStatus = RequestStatus.none;
      }
    }
    update();
  }

  String getOrderType(String type)
  {
    if(type=="0") return "Delivery".tr;
    else return "Receive".tr;
  }

  String getPaymentType(String type)
  {
    if(type=="0") return "Cash".tr;
    else return "Payment Card".tr;
  }

  String getOrderStatus(String type)
  {
    if(type=="0") return "Under review".tr;
    if(type=="1") return "Order is being prepared".tr;
    if(type=="2") return "Order is being delivered".tr;
    else return "Archived".tr;
  }


  void goToOrderDetails(OrderModel orderModel)
  {
    Get.toNamed(AppRoutes.orderDetails,arguments: {
      "orderModel":orderModel,
    });
  }


  // submitRating(String orderId ,double rating ,String feedback)async{
  //   requestStatus =RequestStatus.loading;
  //   update();
  //   if (rating == 0.0) {
  //     Get.snackbar("Waring", "Your rating can\'t be 0 ");
  //   }
  //   else{
  //     var response=await ordersData.ratingData(myServices.shared!.getString("id")!, orderId, rating, feedback);
  //     requestStatus =handlingData(response);
  //     if(requestStatus==RequestStatus.success)
  //     {
  //       print(response['status']);
  //       if(response['status']=="success")
  //       {
  //         Get.snackbar("Success", "Your rating was sent ,Thank you");
  //         getData();
  //       }
  //       else
  //       {
  //         Get.snackbar("Failure", "Something went wrong");
  //       }
  //     }
  //   }
  //   update();
  // }


  @override
  void onInit() {
    getData();
    super.onInit();
  }

}
