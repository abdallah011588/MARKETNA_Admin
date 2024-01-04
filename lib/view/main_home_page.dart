import 'package:admin/controller/main_home_page_controller.dart';
import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:admin/core/functions/alert_exit.dart';
import 'package:admin/view/widgets/custom_button_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomePageControllerImp());
    return GetBuilder<MainHomePageControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor:AppColors.white,
            centerTitle: false,
            title: Image.asset( "assets/images/title2.png",height: 60,),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: (){
                  controller.goToNotificationPage();
                }, icon: SvgPicture.asset(AppImageAsset.notification,height: 23),splashRadius: 25,),
              ),
            ],
          ),

          body: WillPopScope(
           child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.only(top: 10.0),
            child: controller.pages.elementAt(controller.currentPage),
          ),
            onWillPop:()=> alertExitApp(),
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentPage,
           selectedItemColor: AppColors.primaryColor,
           unselectedItemColor: AppColors.black,
           type: BottomNavigationBarType.fixed,
           selectedFontSize: 15,
           onTap: (index){
             controller.changePage(index);
           },
           items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImageAsset.cat,height: 25,color: controller.changeColor(0),),
              label: "Categories".tr,),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImageAsset.products,height: 25,color: controller.changeColor(1)),
              label: "Products".tr,
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset(AppImageAsset.orders,height: 25 ,color: controller.changeColor(2)),label: "Orders".tr,),
            BottomNavigationBarItem(icon: SvgPicture.asset(AppImageAsset.settings,height: 25,color: controller.changeColor(3)),label: "Settings".tr,),
          ]),

          floatingActionButton: (controller.currentPage==0/*|| controller.currentPage==1 */)?
          FloatingActionButton(
            onPressed: () {
              controller.goToAddPage();
            },
            child: SvgPicture.asset(
              AppImageAsset.add,
              color: AppColors.lightGery2,
            ),
            backgroundColor: AppColors.primaryColor,
          ):null,

        );
      },
    );
  }
}


/*
BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: AppColors.lightGery3,
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(
                  controller.pages.length + 1,
                  (index) => index == 2 ? const Spacer()
                      : CustomButtonBottomNavigationBar(
                          onPress: () {
                            print(controller.currentPage);
                            controller.changePage(index > 2 ? index - 1 : index);
                          },
                          childWidget: SvgPicture.asset(
                            controller.pageIcon[index > 2 ? index - 1 : index],
                            color: controller.changeColor(index),
                            height: 25,
                          ),
                        ),
                ),
              ],
            ),
          )
 */












/*

  Widget build(BuildContext context) {
    Get.put(MainHomePageControllerImp());
    return GetBuilder<MainHomePageControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            backgroundColor:AppColors. primaryColor,
            centerTitle: false,
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
            elevation: 5,
            title: Text(controller.pageTitle[controller.currentPage],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.white),),
            leading: Icon(Icons.reorder),
            actions: [
              TextButton(onPressed: (){controller.logOut();}, child: Text("log out"),),
            ],
          ),
          body: WillPopScope(
           child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            margin: const EdgeInsets.only(top: 10.0),
            child: controller.pages.elementAt(controller.currentPage),
          ),
            onWillPop:()=> alertExitApp(),
          ),

          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(
                  controller.pages.length + 1,
                  (index) => index == 2 ? const Spacer()
                      : CustomButtonBottomNavigationBar(
                          onPress: () {
                            controller.changePage(index > 2 ? index - 1 : index);
                          },
                          childWidget: SvgPicture.asset(
                            controller.pageIcon[index > 2 ? index - 1 : index],
                            color: controller.changeColor(index),
                            height: 25,
                          ),
                        ),
                ),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset(
              // AppImageAsset.home,
              AppImageAsset.settings,
              color: AppColors.lightGery2,
            ),
            backgroundColor: AppColors.primaryColor,
          ),

        );
      },
    );
  }


 */