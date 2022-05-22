import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../util/constans.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/widgets/logging_image.dart';
import 'package:itk_project_classified_app/screens/new-User.dart';
import 'package:itk_project_classified_app/screens/ads_listing.dart';

class Loging extends StatelessWidget {
  Loging({Key? key}) : super(key: key);

  final MyGlbControllers _glbControllers = Get.put(MyGlbControllers());

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  final box = GetStorage();

  //loggin

  // Future logginUser() async {
  //   try {
  //     var respon = await http.post(
  //       Uri.parse(constans().apiURl + '/auth/login'),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json'
  //       },
  //       body: jsonEncode({
  //         "email": _emailCtrl.text.trim(),
  //         "password": _passwordCtrl.text.trim(),
  //       }),
  //     );

  //     var _request = jsonDecode(respon.body);
  //     var temp = jsonDecode(respon.body);
  //     if (temp["status"] == true) {
  //       box.write("token", temp["data"]["token"]);
  //       box.write("idUser", temp["data"]["user"]["_id"]);
  //       Get.offAll(ListOfApps());
  //     }
  //     return _request;
  //   } catch (error) {
  //     // print(error);
  //     return error;
  //   }
  // }

  logingWithFirebase() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      print("Login success");
      Get.to(ListOfApps());
    }).catchError((e) {
      print(e);
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
                const LogingImage(),
                const SizedBox(
                  height: 12,
                ),
                myTextField(
                  myControler: _emailCtrl,
                  myTextInput: TextInputType.emailAddress,
                  title: "Email Address",
                ),
                myTextField(
                  myControler: _passwordCtrl,
                  myTextInput: TextInputType.visiblePassword,
                  isPassword: true,
                  title: "Password",
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),

                      // what is goint to do the button uf we press it
                      onPressed: () async {
                        // var userinfo = await logginUser();
                        print("click login");

                        await logingWithFirebase();

                        // if (_emailCtrl.text.trim() == '' ||
                        //     _passwordCtrl.text.trim() == "") {
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
                        //                 },   ss
                        //               )
                        //             ],
                        //           ));
                        // } else if (userinfo["status"] != true) {
                        //   showDialog(
                        //       context: context,
                        //       builder: (contex) => AlertDialog(
                        //             title: Text("Error"),
                        //             content: Text(userinfo["message"]),
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
                    "Don't have any account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Get.to(newUser());
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
