
import 'package:admin/controller/forget_password/forget_password_controller.dart';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/functions/validator.dart';
import 'package:admin/view/widgets/auth/custom_button_auth.dart';
import 'package:admin/view/widgets/auth/custom_textform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "forgetPassword".tr,
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
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Form(
          key: controller.formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                "forgetPassword".tr,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "forgetPasswordSubtitle".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextFormField(
                keyBoardType: TextInputType.emailAddress,
                label: "Email".tr,
                hint: "Enter_email".tr,
                suffixIcon: Icons.email_outlined,
                controller: controller.emailController,
                borderRadius: 30,
                valid: (val) {
                  return validInput(val!, 11, 50, "email");
                },
              ),
              const SizedBox(
                height: 60,
              ),
              controller.requestStatus==RequestStatus.loading?
              Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
                  :CustomButtonAuth(
                onPressed: () {
                  controller.verification();
                },
                text: "Continue".tr,
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
