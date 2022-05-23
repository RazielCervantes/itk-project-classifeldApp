import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:itk_project_classified_app/screens/My-Publish-Ads.dart';
import 'package:itk_project_classified_app/screens/create-Ad.dart';
import 'package:itk_project_classified_app/screens/check-Product.dart';
import 'package:itk_project_classified_app/screens/my-Publish-Ads.dart';
import 'package:itk_project_classified_app/screens/page-Settings.dart';
import 'package:itk_project_classified_app/util/constans.dart';

class MyGlbControllers extends GetxController {
  final box = GetStorage();

  RxString userNameCtr = "user name".obs;

  RxString userIdCtrl = 'user id'.obs;
  RxString userProfileEmailCtr = 'user email'.obs;
  RxString userProfileMobileCtr = 'user mobile'.obs;
  RxString userProfileImagectr =
      'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'
          .obs;
  RxString userProfileDatectr = 'user date'.obs;

  Future getProfileInfo() async {
    try {
      var token = box.read('token');
      var respon = await http.post(
        Uri.parse(constans().apiURl + '/user/profile'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      var _request = jsonDecode(respon.body);

      if (_request["status"] == true) {
        userNameCtr.value = _request["data"]["name"];
        userProfileEmailCtr.value = _request["data"]["email"];
        userProfileMobileCtr.value = _request["data"]["mobile"];
        userProfileImagectr.value = _request["data"]["imgURL"];
        userProfileDatectr.value = _request["data"]["date"];
      }

      print(_request);
      update();
      return _request;
    } catch (error) {
      return error;
    }
  }
}
