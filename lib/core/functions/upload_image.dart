
import 'dart:io';

import 'package:admin/core/constant/colors.dart';
import 'package:admin/core/constant/image_asset.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

uploadImageCamera()async
{
  final PickedFile? pickedFile= await ImagePicker().getImage(source: ImageSource.camera,imageQuality: 90);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}



uploadFileGallery([ isSvg = false ])async
{
  FilePickerResult ? result=await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg? ['svg' , 'SVG']:["jpg", "png", "gif","jpeg"],
  );

  if (result != null) {
    return File(result.files.single.path!);
  }
  else {
    return null;
  }
}

showBottomMenu(uploadImageCamera(),uploadFileGallery())
{
  Get.bottomSheet(
    Directionality(textDirection: TextDirection.ltr, child: Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("Choose Image",style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold,fontSize: 20),)),
          const Padding(padding: EdgeInsets.only(top: 10)),
          ListTile(
            shape: Border.all(color: AppColors.lightGery,width: 1),
            leading: SvgPicture.asset(AppImageAsset.camera,height: 30,color: AppColors.primaryColor),
            title: Text("Image from camera"),
            onTap: (){
              uploadImageCamera();
              Get.back();
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            shape: Border.all(color: AppColors.lightGery,width: 1),

            leading: Icon(Icons.image_outlined,size: 40,color: AppColors.primaryColor),
            title: Text("Image from gallery"),
            onTap: (){
              uploadFileGallery();
              Get.back();
            },
          ),
        ],
      ),
    ),
    ),
    backgroundColor: AppColors.white,

  );
}