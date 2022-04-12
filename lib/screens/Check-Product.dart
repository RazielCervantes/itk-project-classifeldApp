import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/Ads.listing.dart';
import 'package:itk_project_classified_app/screens/Check-Image.dart';

class CheckProd extends StatelessWidget {
  const CheckProd({Key? key}) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "here goes product name",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 23),
              ),
              SizedBox(height: 8.0),
              Text(
                "here goes price",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Colors.orange),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(CheckImage());
                  },
                  child: Container(
                    height: 260,
                    width: double.infinity,
                    child: Image.asset(
                      "images/producto3.jpg",
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
                          Text("All")
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
                          Text("here go the time")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 12),
                child: Text(
                  "here goes the description of the product. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu elit viverra, euismod risus in, luctus nunc. Integer non nisl vel tellus aliquet tincidunt non quis nisi. Cras et lobortis quam. Mauris eu ipsum sed enim congue tempus. Vivamus lacus mi, pellentesque ac ex sit amet, pellentesque dictum libero. ",
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
                  style: ElevatedButton.styleFrom(primary: Colors.orange[900]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
