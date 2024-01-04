
class AppLink
{
  static const String serverAdmin= "http://192.168.247.5/ecommerce/admin";
  static const String image= "http://192.168.247.5/ecommerce/upload";
  static const String categoryImage= "http://192.168.247.5/ecommerce/upload/categories/";
  static const String productImage= "http://192.168.247.5/ecommerce/upload/products/";

  /// AUTH
  static const String login= "$serverAdmin/auth/login.php";

  /// Forget Password
  static const String checkEmail= "$serverAdmin/forgetPassword/checkEmail.php";
  static const String verifyCodeForgetPassword= "$serverAdmin/forgetPassword/verifycode.php";
  static const String resetPassword= "$serverAdmin/forgetPassword/resetPassword.php";


  /// Orders
  // static const String deleteOrder= "$server/orders/delete.php";
  // static const String rating= "$server/orders/rating.php";

  static const String pending= "$serverAdmin/orders/viewPending.php";
  static const String approve = "$serverAdmin/orders/approve.php";
  static const String prepare = "$serverAdmin/orders/prepare.php";
  static const String details= "$serverAdmin/orders/details.php";
  static const String accepted= "$serverAdmin/orders/viewAccepted.php";
  static const String archived= "$serverAdmin/orders/archived.php";

  /// CATEGORIES
  static const String categoriesView= "$serverAdmin/categories/view.php";
  static const String categoriesAdd= "$serverAdmin/categories/add.php";
  static const String categoriesEdit= "$serverAdmin/categories/edit.php";
  static const String categoriesDelete= "$serverAdmin/categories/delete.php";


  /// Products
  static const String productsView= "$serverAdmin/products/view.php";
  static const String productsAdd= "$serverAdmin/products/add.php";
  static const String productsEdit= "$serverAdmin/products/edit.php";
  static const String productsDelete= "$serverAdmin/products/delete.php";

  static const String notification= "$serverAdmin/notification.php";
  static const String deleteNotification= "$serverAdmin/deleteNotification.php";
  static const String deleteAllNotification= "$serverAdmin/deleteAllNotification.php";

}


