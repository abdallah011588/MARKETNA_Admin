

import 'package:admin/controller/forget_password/verifycode_forget_password_controller.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(VerifyCodeForgetPasswordControllerImp());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "verifyCode".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            )),
      ),
      body: GetBuilder<VerifyCodeForgetPasswordControllerImp>(
        builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              "verifyCode".tr,
              textAlign: TextAlign.center,
              style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "verifyCodeSubtitle".tr+controller.email!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            OtpTextField(
              numberOfFields: 5,
              // borderColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              cursorColor: AppColors.primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,

              obscureText: true,
              borderRadius: BorderRadius.circular(15),
              fieldWidth: 55,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode) {
                controller.goToResetPassword(verificationCode);
              }, // end onSubmit
            ),
            const SizedBox(
              height: 60,
            ),
            TextButton(
                onPressed: () {
                  controller.resendCode();
                },
                child: Text(
                  "resendVerifyCode".tr,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ],
        ),
      ),
      ),
    );
  }
}
