import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {

  final RequestStatus requestStatus;
  final Widget widget;
  const HandlingDataView({Key? key,required this.requestStatus,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(requestStatus==RequestStatus.loading)
    {
      return Center(child:Lottie.asset( AppImageAsset.loading,height:200),);
    }
     if(requestStatus==RequestStatus.offline_failure)
    {
      return Center(child: Lottie.asset(AppImageAsset.offline));
    }
    if(requestStatus==RequestStatus.server_failure)
    {
      return Center(child: Lottie.asset(AppImageAsset.server));
    }
    if(requestStatus==RequestStatus.failure)
    {
      return Center(child:Lottie.asset(AppImageAsset.noData2,) );
    }
    else
    {
      return widget;
    }

  }

}
