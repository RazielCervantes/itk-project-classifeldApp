import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itk_project_classified_app/screens/ads_listing.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/widgets/logging_image.dart';
import 'package:itk_project_classified_app/screens/login-screen-screen.dart';

import '../util/constans.dart';

class newUser extends StatefulWidget {
  newUser({Key? key}) : super(key: key);

  @override
  State<newUser> createState() => _newUserState();
}

class _newUserState extends State<newUser> {
  final TextEditingController _newUserNameCtrl = TextEditingController();

  final TextEditingController _newUserEmailCtrl = TextEditingController();

  final TextEditingController _newUserNumberCtrl = TextEditingController();

  final TextEditingController _newUserPasswordCtrl = TextEditingController();

  // Future registerNewUsers() async {
  //   try {
  //     var respon = await http.post(
  //       Uri.parse(constans().apiURl + '/auth/register'),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json'
  //       },
  //       body: jsonEncode({
  //         "name": _newUserNameCtrl.text,
  //         "email": _newUserEmailCtrl.text,
  //         "password": _newUserPasswordCtrl.text,
  //         "mobile": _newUserNumberCtrl.text
  //       }),
  //     );

  //     var _request = jsonDecode(respon.body);
  //     return _request;
  //   } catch (error) {
  //     ;
  //     return error;
  //   }
  // }

  registerWithFirebase() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _newUserEmailCtrl.text, password: _newUserPasswordCtrl.text)
        .then((value) {
      print("register success");
      inserToFirestore();
      Get.to(ListOfApps());
    }).catchError((e) {
      print(e);
    });
  }

  inserToFirestore() {
    // FirebaseFirestore.instance.collection("accounts").add({
    //   "userId": FirebaseAuth.instance.currentUser!.uid,
    //   "fullname": _newUserNameCtrl.text,
    //   "email": _newUserEmailCtrl.text,
    //   "mobile": _newUserNumberCtrl.text,
    //   "createdAt": FieldValue.serverTimestamp(),
    // }
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection("accounts").doc(uid).set({
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "fullname": _newUserNameCtrl.text,
      "email": _newUserEmailCtrl.text,
      "mobile": _newUserNumberCtrl.text,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                LogingImage(),
                SizedBox(height: 12),
                myTextField(
                  myControler: _newUserNameCtrl,
                  myTextInput: TextInputType.name,
                  title: "Full Name",
                ),
                myTextField(
                  myControler: _newUserEmailCtrl,
                  myTextInput: TextInputType.emailAddress,
                  title: "Email Address",
                ),
                myTextField(
                  myControler: _newUserNumberCtrl,
                  myTextInput: TextInputType.number,
                  title: "Mobile Number",
                ),
                myTextField(
                  myControler: _newUserPasswordCtrl,
                  myTextInput: TextInputType.visiblePassword,
                  title: "Password",
                  isPassword: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () async {
                        registerWithFirebase();

                        // var newUserinfo = await registerNewUsers();

                        // if (_newUserNameCtrl.text.trim() == '' ||
                        //     _newUserEmailCtrl.text.trim() == "" ||
                        //     _newUserNumberCtrl.text.trim() == '' ||
                        //     _newUserPasswordCtrl.text.trim() == "") {
                        //   showDialog(
                        //       context: context,
                        //       builder: (contex) => AlertDialog(
                        //             title: Text("Error"),
                        //             content: Text("Please Fill Out All Fields"),
                        //             actions: <Widget>[
                        //               IconButton(
                        //                 icon: Icon(Icons.close),
                        //                 onPressed: () {
                        //                   Navigator.pop(contex);
                        //                 },
                        //               )
                        //             ],
                        //           ));
                        // } else if (newUserinfo["status"] == true) {
                        //   Get.to(ListOfApps());
                        // } else {
                        //   showDialog(
                        //       context: context,
                        //       builder: (contex) => AlertDialog(
                        //             title: Text("Error"),
                        //             content: Text(newUserinfo["message"]),
                        //             actions: <Widget>[
                        //               IconButton(
                        //                 icon: Icon(Icons.close),
                        //                 onPressed: () {
                        //                   Navigator.pop(contex);
                        //                 },
                        //               )
                        //             ],
                        //           ));
                        // }
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Alredy have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Get.to(Loging());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
