import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:itk_project_classified_app/screens/ads_listing.dart';
import 'package:itk_project_classified_app/screens/login-screen-screen.dart';
import 'package:itk_project_classified_app/screens/new-User.dart';
import 'package:itk_project_classified_app/screens/testing.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        // child: Loging(),
        child: Loging(),
      ),
    );
  }
}
