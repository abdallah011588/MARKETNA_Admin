import 'dart:async';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/data/data_source/remote/orders/order_details.dart';
import 'package:admin/data/model/order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController
{

  late RequestStatus requestStatus;
  OrderDetailsData orderDetailsData =OrderDetailsData(Get.find());

  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  CameraPosition? cameraPosition ;
  OrderModel? orderModel;
  Set<Marker> markers={};

  List data=[];

  initialData()
  {
    requestStatus=RequestStatus.loading;
    if(orderModel!.orderType =="0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(orderModel!.addressLat!),
            double.parse(orderModel!.addressLong!)),
        zoom: 8,
      );
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(orderModel!.addressLat!),
              double.parse(orderModel!.addressLong!)),
        ),
      );
      requestStatus=RequestStatus.success;
    }
    update();

  }

  getOrderDetails()async
  {
    requestStatus =RequestStatus.loading;
    update();

    var response= await orderDetailsData.getData(orderModel!.orderId!);

    requestStatus =handlingData(response);

    if(RequestStatus.success == requestStatus)
      {
        if(response['status']=="success")
          {
            List listData = response['data'];
            data.addAll(listData.map((e) => e));
            print("**************************${data}");
          }
        else{
          requestStatus=RequestStatus.failure;
        }
      }
    update();
  }

  @override
  void onInit() {
    orderModel=Get.arguments['orderModel'];
    getOrderDetails();
    initialData();
    print(orderModel!.orderId);
    super.onInit();
  }
}