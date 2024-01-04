
import 'package:admin/controller/forget_password/reset_password_controller.dart';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/functions/validator.dart';
import 'package:admin/view/widgets/auth/custom_button_auth.dart';
import 'package:admin/view/widgets/auth/custom_textform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Get.put(ResetPasswordControllerImp());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "resetPassword".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            )),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Form(
          key: controller.formKey,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll){
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                Text(
                  "resetPassword".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "resetPasswordSubtitle".tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextFormField(
                  borderRadius: 30,
                  keyBoardType: TextInputType.visiblePassword,
                  label: "Password".tr,
                  hint: "Enter_password".tr,
                  suffixIcon: Icons.lock_outlined,
                  controller: controller.passwordController,
                  password: true,
                  valid: (val) {
                    return validInput(val!, 5, 50, "password");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  borderRadius: 30,
                  keyBoardType: TextInputType.visiblePassword,
                  label: "Password".tr,
                  hint: "Renter_password".tr,
                  suffixIcon: Icons.lock_reset_outlined,
                  controller: controller.rePasswordController,
                  password: true,

                  valid: (val) {
                    return validInput(val!, 5, 50, "password");
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                controller.requestStatus==RequestStatus.loading?
                Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                    :CustomButtonAuth(
                  onPressed: () {
                    controller.resetPass();
                  },
                  text: "Continue".tr,
                ),
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
