
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:admin/core/class/request_status.dart';
import 'package:admin/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String basicAuth="Basic ${base64Encode(utf8.encode("dddd:sdfsdfsdfsdfdsf"))}";
Map<String ,String >headers={
  //'content-type:'application/json',
  //'accept':'application/json',
  'authorization':basicAuth,
};

class CRUD{

  Future< Either<RequestStatus,Map> > postData(String linkUrl , Map data)async
  {
     try
       {
          if(await checkInternet())
          {
            var response =await http.post(Uri.parse(linkUrl) , body: data);
            if(response.statusCode==200 || response.statusCode==201)
            {
              Map responseBody = jsonDecode(response.body);
              print(responseBody);
              return Right(responseBody);
            }
            else
            {
              return const Left( RequestStatus.server_failure);
            }
          }
          else
          {
            return const Left( RequestStatus.server_failure);
          }
       } catch(_) {
        return const Left( RequestStatus.server_exception);
      }
  }

  postRequestWithFile(String url ,Map data ,File file)async
  {
    var request=http.MultipartRequest("POST",Uri.parse(url));
    var length =await file.length();
    var stream = http.ByteStream(file.openRead());
    var multiPartFile=http.MultipartFile("category_image",stream,length,filename: basename(file.path));
    request.files.add(multiPartFile);
    data.forEach((key, value) {request.fields[key]=value;});
    var myRequest=await request.send();
    var response=await http.Response.fromStream(myRequest);
    if(response.statusCode==200 || response.statusCode==201)
    {
      Map responseBody = jsonDecode(response.body);
      print(responseBody);
      return responseBody;
    }
  }


  Future< Either<RequestStatus,Map> > postRequestWithOneFile(String linkUrl , Map data ,String imageRequestName,File file)async
  {
    try
    {
      if(await checkInternet())
      {
        //var response =await http.post(Uri.parse(linkUrl) , body: data);
        var request = http.MultipartRequest("POST", Uri.parse(linkUrl));
        request.headers.addAll(headers);
        if(file !=null )
          {
            var length = await file.length();
            var stream = http.ByteStream(file.openRead());
            stream.cast();
            var multiPartFile = http.MultipartFile(imageRequestName,stream,length,filename: basename(file.path));
            request.files.add(multiPartFile);
          }

        /// add data to request
        data.forEach((key, value) {
          request.fields[key]=value;
        });

        /// send request
        var myRequest = await request.send();

        var response = await http.Response.fromStream(myRequest);
        if(response.statusCode==200 || response.statusCode==201)
        {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        }
        else
        {
          return const Left( RequestStatus.server_failure);
        }
      }
      else
      {
        return const Left( RequestStatus.server_failure);
      }
    } catch(_) {
      return const Left( RequestStatus.server_exception);
    }
  }



}
