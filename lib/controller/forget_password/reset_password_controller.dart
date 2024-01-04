
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handling_data.dart';
import 'package:admin/data/data_source/remote/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPass();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  String?  email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RequestStatus? requestStatus;
  ResetPasswordData resetPasswordData =ResetPasswordData(Get.find());
  @override
  resetPass() async{
    var formData = formKey.currentState;
    if (formData!.validate() ) {

      if(passwordController.text !=rePasswordController.text)
        {
          Get.defaultDialog(
            title: "Warning".tr,
            middleText:"Password is not match".tr ,
          );
        }
      else
        {
          requestStatus = RequestStatus.loading;
          update();
          var response  = await resetPasswordData.postData(
            email!,
            passwordController.text,
          );

          requestStatus = handlingData(response);
          if(requestStatus == RequestStatus.success)
          {
            if(response['status'] == "success")
            {
              Get.offAllNamed(AppRoutes.resetPasswordSuccess);
            }
            else
            {
              Get.defaultDialog(
                title: "Warning".tr,
                middleText:"Something went wrong!".tr ,
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
  }

  @override
  void onInit() {
    email =Get.arguments['email'];
    rePasswordController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    rePasswordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
