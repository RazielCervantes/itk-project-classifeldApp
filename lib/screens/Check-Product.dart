import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/ads_listing.dart';
import 'package:itk_project_classified_app/screens/check-Image.dart';

class CheckProd extends StatelessWidget {
  final String product;
  final String cost;
  final String time;
  final String ImageUri;
  final String description;

  const CheckProd({
    Key? key,
    required this.product,
    required this.cost,
    required this.ImageUri,
    required this.time,
    required this.description,
  }) : super(key: key);

  // _openURL(url) async {
  //   if (await canLaunchUrl(url)) {
  //     launchUrl(url);
  //   } else {
  //     print("can't launch");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.to(ListOfApps());
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$product",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
                ),
                SizedBox(height: 8.0),
                Text(
                  "$cost",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: Colors.orange),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(CheckImage(imageProd: ImageUri));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CheckImage(imageProd: ImageUri)));
                    },
                    child: Container(
                      height: 260,
                      width: double.infinity,
                      child: Image.network(
                        ImageUri,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Icon(Icons.person_outline_outlined),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text("All"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(time.toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 12),
                  child: Text(
                    "$description",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    child: const Text(
                      "Contact Seller",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(primary: Colors.orange[900]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
