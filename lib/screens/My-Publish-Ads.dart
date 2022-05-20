import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/edit-Ad.dart';
import 'package:itk_project_classified_app/screens/new-User.dart';
import '../controllers/mycontroller.dart';
import '../util/constans.dart';

class Ads extends StatefulWidget {
  Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  final MyGlbControllers _glbControllers = Get.put(MyGlbControllers());
  final box = GetStorage();
  final String _defaulImg =
      "https://images.assetsdelivery.com/compings_v2/pavelstasevich/pavelstasevich1811/pavelstasevich181101027.jpg";

  var myads; //Variable with a form of list to save the ads's information

  Future<String> getAdsInfo() async {
    var token = box.read("token");
    var response = await http.post(
      Uri.parse(constans().apiURl + '/ads/user'),
      headers: {
        'Content-type': "application/json; charset=UTF-8",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    setState(() {
      myads = jsonDecode(response.body);
    });

    return "success!";
  }

  @override
  void initState() {
    getAdsInfo();

    // TODO: implement initState
    super.initState();
  }

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
            itemCount: myads == null ? 0 : myads["data"].length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildproduct(myads["data"][index]));
            },
          ),
        ),
      ),
    );
  }
}

@override
Widget buildproduct(Map myads) {
  return GestureDetector(
    onTap: () {
      Get.to(EditAd(
        productName: myads["title"],
        productCost: myads["price"].toString(),
        number: myads["mobile"],
        productDescrip: myads["description"],
        addImages: myads["images"],
        productid: myads["_id"],
      ));
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4.0)),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(myads["images"][0]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myads["title"],
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 20,
                    ),
                    Text(
                      myads["createdAt"],
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  "\$" + myads["price"].toString(),
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
