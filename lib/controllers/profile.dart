import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/ads_listing.dart';

class ProfileController extends GetxController {
  List accountsInfo = [].obs;

  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  getAccountInfo() {
    firestore
        .collection("accounts")
        .where('userId', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((res) {
      if (res.docs.length > 0) {
        var tmp = [];
        res.docs.forEach((ads) {
          tmp.add({"id": ads.id, ...ads.data()});
        });
        print(tmp);
        accountsInfo.assignAll(tmp);
      }
    });
  }

  void UpdateMyProfile(
    uid,
    name,
    email,
    mobile,
  ) {
    firestore.collection("accounts").doc(uid).update({
      "fullname": name,
      "email": email,
      "mobile": mobile,
    }).then((value) {
      print("update Success");
      Get.to(ListOfApps());
    });
  }
}
