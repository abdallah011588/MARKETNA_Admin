
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/data/data_source/remote/forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  verification();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RequestStatus? requestStatus;
  ForgetPasswordData checkEmail =ForgetPasswordData(Get.find());


  @override
  verification()async {

    var formData = formKey.currentState;
    if (formData!.validate()) {

      requestStatus = RequestStatus.loading;
      update();
      var response  = await checkEmail.postData(
        emailController.text,
      );

      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success)
      {
        if(response['status'] == "success")
        {
          Get.offAllNamed(AppRoutes.verifyCode, arguments: {
            "email" : emailController.text,
          });
        }
        else
        {
          Get.defaultDialog(
            title: "Warning".tr,
            middleText:"Email is not exist or incorrect".tr ,
          );
          requestStatus = RequestStatus.failure;
        }
      }
      if(requestStatus == RequestStatus.server_failure)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"Something went wrong server failure!".tr ,
        );
      }
      if(requestStatus == RequestStatus.server_exception)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"Something went wrong server exception!".tr ,
        );
      }
      if(requestStatus == RequestStatus.offline_failure)
      {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText:"You are offline!".tr ,
        );
      }

      update();



    }
  }


  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
