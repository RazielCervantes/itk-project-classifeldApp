import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/check-Product.dart';

class CheckImage extends StatelessWidget {
  final String imageProd;
  const CheckImage({Key? key, required this.imageProd}) : super(key: key);

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
                // Get.to(CheckProd(product: product, cost: cost, ImageUri: ImageUri, time: time));
                Navigator.pop(context);
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 800,
            width: double.infinity,
            child: Image.asset(
              imageProd,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
