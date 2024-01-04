
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widgets/auth/custom_button_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "loginSuccess".tr,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          Image.asset(AppImageAsset.successImage,height:  MediaQuery.of(context).size.width*0.8 ,  fit: BoxFit.fill ,),
          Text("loginSuccess".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
            ),
          Container(
            width: MediaQuery.of(context).size.width*0.6,
            child: CustomButtonAuth(
                  onPressed: (){
                    Get.offNamed(AppRoutes.homePage);
                  },
                text: "backHome".tr,
              ),
          ),

          ],
        ),
      ),
    );
  }
}
