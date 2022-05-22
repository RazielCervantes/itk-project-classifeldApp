import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  RxBool wasSuccess = false.obs;
  List ads = [].obs;
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  void addNewAd(title, price, mobile, descrp) {
    firestore.collection("ads").add({
      "title": title,
      "Price": price,
      "Mobile": mobile,
      "Description": descrp,
      "Createat": FieldValue.serverTimestamp(),
      "uid": auth.currentUser!.uid,
    }).then((value) {
      wasSuccess = true as RxBool;
    }).catchError((e) {
      print(e);
    });
  }

  void getMyAds() {
    firestore.collection("ads").get().then((res) {
      if (res.docs.length > 0) {
        var tmp = [];
        res.docs.forEach((ads) {
          tmp.add({"id": ads.id, ...ads.data()});
        });
        print(tmp);
        ads.assignAll(tmp);
      }
    });
  }
}
