import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/Login_screen_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Loging(),
      ),
    );
  }
}
