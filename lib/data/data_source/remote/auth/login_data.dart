


import 'package:admin/core/class/crud.dart';
import 'package:admin/link_api.dart';

class LoginData
{
  CRUD crud;
  LoginData(this.crud);

  postData(String email,String password)async
  {
    var response = await crud.postData(
      AppLink.login ,
      {
      "email":email,
      "password":password,
      },
    );

    return response.fold((l) => l, (r) => r);
  }
}