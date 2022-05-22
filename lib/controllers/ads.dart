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

  void getAllAds() {
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

  void getMyAds() {
    firestore
        .collection("ads")
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((res) {
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

  void UpdateMyAds(id, title, price, mobile, description) {
    firestore.collection("ads").doc(id).update({
      "title": title,
      "Price": price,
      "Mobile": mobile,
      "Description": description,
    });
  }
}
