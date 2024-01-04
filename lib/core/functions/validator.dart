import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Username isn't valid!".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Email isn't valid!".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Phone number isn't valid!".tr;
    }
  }

  if (val.isEmpty) {
    return "Can't be empty!".tr;
  }

  if (val.length < min) {
    return "Can't be less than".tr+" $min!";
  }

  if (val.length > max) {
    return "Can't be more than".tr+" $max!";
  }

}
