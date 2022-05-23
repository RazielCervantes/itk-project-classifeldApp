import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:itk_project_classified_app/screens/ads_listing.dart';
import 'package:itk_project_classified_app/screens/check-Image.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckProd extends StatefulWidget {
  final String product;
  final String cost;
  final time;
  final String imageUri;
  final String description;
  final String sellerContact;
  final String sellername;

  const CheckProd({
    Key? key,
    required this.product,
    required this.cost,
    required this.imageUri,
    required this.time,
    required this.description,
    required this.sellerContact,
    required this.sellername,
  }) : super(key: key);

  @override
  State<CheckProd> createState() => _CheckProdState();
}

class _CheckProdState extends State<CheckProd> {
  _openUrl(String urlString) async {
    Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      print("can't launch $url");
    }
  }

  var firestore = FirebaseFirestore.instance;

  var auth = FirebaseAuth.instance;

  List info = [];

  void getsellersName() {
    firestore
        .collection("accounts")
        .where('userId', isEqualTo: widget.sellername)
        .get()
        .then((res) {
      if (res.docs.length > 0) {
        var tmp = [];
        res.docs.forEach((ads) {
          tmp.add({"id": ads.id, ...ads.data()});
        });
        print(tmp);
        setState(() {
          info.assignAll(tmp);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsellersName();
  }

  @override
  Widget build(BuildContext context) {
    DateTime tims = DateTime.parse(widget.time);

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
                  "${widget.product}",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
                ),
                SizedBox(height: 8.0),
                Text(
                  "${widget.cost}",
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
                                  CheckImage(imageProd: widget.imageUri)));
                    },
                    child: Container(
                      height: 260,
                      width: double.infinity,
                      child: Image.network(
                        widget.imageUri,
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
                              // child: Text("$sellername"),
                              child: Text(info.isEmpty
                                  ? "seller name"
                                  : info[0]["fullname"]),
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
                              child: Text(timeago.format(tims, locale: 'en')),
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
                    "${widget.description}",
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
                    onPressed: () async {
                      _openUrl("tel: ${widget.sellerContact}");
                    },
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

  canLaunch(url) {}

  void launch(url) {}
}
