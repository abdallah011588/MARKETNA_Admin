

import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';

class ForgetPasswordData
{
  CRUD crud;
  ForgetPasswordData(this.crud);

  postData(String email)async
  {
    var response = await crud.postData(
      AppLink.checkEmail ,
      {
        "email":email,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}