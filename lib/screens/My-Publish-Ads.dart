import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/New-User2.dart';
import 'package:itk_project_classified_app/screens/Edit-Ad7.dart';

List<dynamic> TheProducts3 = [
  {
    "product": "AirPods",
    "cost": "999",
    "contact": "8 ",
    "time": "12",
    "Image": "images/producto3.jpg",
    "description": "its an airpod"
  },
  {
    "product": "Imac",
    "cost": "11900",
    "contact": "10 ",
    "time": "12",
    "Image": "images/producto4.jpg",
    "description": "its a mac"
  },
  {
    "product": "Yeti Mic",
    "cost": "876",
    "contact": "15 ",
    "time": "12",
    "Image": "images/producto6.jpg",
    "description": "its a mic"
  },
  {
    "product": "Alexa 4th Gen",
    "cost": "600",
    "contact": "14",
    "time": "12",
    "Image": "images/producto7.jpg",
    "description": "its an assistan"
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
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
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
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  "\$" + TheProducts3["cost"],
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
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
