
import 'package:admin/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnAr,columnEn)
{
  MyServices myServices =Get.find();
  if(myServices.shared!.getString("lang")=="ar")
    {
      return columnAr;
    }else
      {
        return columnEn;
      }
}