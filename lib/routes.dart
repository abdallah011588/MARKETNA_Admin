

import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/middleware/middleware.dart';
import 'package:admin/view/auth/forget_password/forget_password.dart';
import 'package:admin/view/auth/forget_password/reset_password.dart';
import 'package:admin/view/auth/forget_password/reset_password_success.dart';
import 'package:admin/view/auth/forget_password/verify_code.dart';
import 'package:admin/view/auth/login.dart';
import 'package:admin/view/auth/login_success.dart';
import 'package:admin/view/categories/add.dart';
import 'package:admin/view/categories/edit.dart';
import 'package:admin/view/categories/view.dart';
import 'package:admin/view/language.dart';
import 'package:admin/view/main_home_page.dart';
import 'package:admin/view/notifications.dart';
import 'package:admin/view/orders/accepted.dart';
import 'package:admin/view/orders/archived.dart';
import 'package:admin/view/orders/details.dart';
import 'package:admin/view/orders/pending.dart';
import 'package:admin/view/products/add_product.dart';
import 'package:admin/view/products/edit_product.dart';
import 'package:admin/view/products/view_product.dart';
import 'package:admin/view/splash.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> ? routes=[
  GetPage(name: AppRoutes.splash, page: ()=> Splash()),
  GetPage(name: AppRoutes.language, page: ()=> Language(),
    middlewares: [
      MyMiddleWare(),
    ],),
  GetPage(name: AppRoutes.homePage, page: ()=> MainHomePage()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.resetPasswordSuccess, page: () => const ResetPasswordSuccess()),
  GetPage(name: AppRoutes.loginSuccess, page: () => const LoginSuccess()),
  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),

  GetPage(name: AppRoutes.categoriesView, page: () => const ViewCategories()),
  GetPage(name: AppRoutes.categoriesAdd, page: () => const AddCategory()),
  GetPage(name: AppRoutes.categoriesEdit, page: () => const EditCategory()),

  GetPage(name: AppRoutes.productsView, page: () => const ViewProducts()),
  GetPage(name: AppRoutes.productsAdd, page: () => const AddProduct()),
  GetPage(name: AppRoutes.productsEdit, page: () => const EditProduct()),


  GetPage(name: AppRoutes.pending, page: () => const Pending()),
  GetPage(name: AppRoutes.archived, page: () => const Archived()),
  GetPage(name: AppRoutes.accepted, page: () => const Accepted()),
  GetPage(name: AppRoutes.notification, page: () => const Notifications()),

];