import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/New-User2.dart';
import 'package:itk_project_classified_app/screens/Edit-Ad7.dart';

List<dynamic> TheProducts3 = [
  {
    "product": "Samsung For sale",
    "cost": "12000.0",
    "contact": "84253543",
    "time": "8",
    "Image": "images/mobile_3.jpg",
    "description":
        "its a celular. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit."
  },
  {
    "product": "iPhone For Sale",
    "cost": "33000.0",
    "contact": "84253",
    "time": "18",
    "Image": "images/mobile_1.jpg",
    "description":
        "its a Iphone. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit."
  },
  {
    "product": "Used Macbook Pro for sale",
    "cost": "45000.0",
    "contact": "+919ii643210 ",
    "time": "18",
    "Image": "images/apple-macbook-pro-m1.jpg",
    "description":
        "its a mac. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit. "
  },
];

class Ads extends StatelessWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Ads",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: TheProducts3.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(4),
                child: buildproduct(TheProducts3[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

@override
Widget buildproduct(Map TheProducts3) {
  return GestureDetector(
    onTap: () {
      Get.to(EditAd());
    },
    child: Padding(
      padding: EdgeInsets.all(3.0),
      child: Card(
        elevation: 4.0,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(TheProducts3["Image"]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TheProducts3["product"],
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 20,
                    ),
                    Text(
                      TheProducts3["time"] + "days ago",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  "\$" + TheProducts3["cost"],
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.orange),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
