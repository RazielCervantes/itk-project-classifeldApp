import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/Check-Product.dart';

class CheckImage extends StatelessWidget {
  const CheckImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(CheckProd());
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 500,
            width: double.infinity,
            child: Image.asset(
              "images/apple-macbook-pro-m1.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
