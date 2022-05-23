import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:itk_project_classified_app/controllers/ads.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import '../util/constans.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';

import 'ads_listing.dart';

var _imagesURL;

class CreateAd extends StatefulWidget {
  CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  final AdsController _adsController = Get.put(AdsController());

  final TextEditingController _newAdTitleCtrl = TextEditingController();

  final TextEditingController _newAdPriceCtrl = TextEditingController();

  final TextEditingController _newAdDescriptionCtrl = TextEditingController();

  final TextEditingController _newAdNumberCtrl = TextEditingController();

  final box = GetStorage();

  late bool wasadded = _adsController.wasSuccess as bool;

  var _imageURL;

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  // PickMultipleImages() async {
  //   var images = await ImagePicker().pickMultiImage();
  //   if (images!.isNotEmpty) {
  //     //upload images
  //     var request = http.MultipartRequest(
  //         "POST", Uri.parse(constans().apiURl + '/upload/photos'));
  //     images.forEach((images) async {
  //       request.files
  //           .add(await http.MultipartFile.fromPath('photos', images.path));
  //     });
  //     var res = await request.send();
  //     var respData = await res.stream.toBytes();
  //     var respStr = String.fromCharCodes(respData);
  //     var jsonObj = json.decode(respStr);
  //     print(jsonObj["data"]["path"]);
  //     setState(() {
  //       _imagesURL = (jsonObj["data"]["path"]);
  //     });
  //   } else {
  //     print("no images picked");
  //   }
  // }

  uploadImage() async {
    var filePath = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (filePath!.path.length != 0) {
      File file = File(filePath.path);
      var storageRef = await FirebaseStorage.instance
          .ref()
          .child("uploads")
          .child(getRandomString(12))
          .putFile(file);

      var uploadedURL = await storageRef.ref.getDownloadURL();
      setState(() {
        _imageURL = uploadedURL;
      });
      FirebaseFirestore.instance
          .collection("ads")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"imageURL": _imageURL});
    }
  }

  // Future uploadAd() async {
  //   try {
  //     var token = box.read("token");
  //     var respon = await http.post(
  //       Uri.parse(constans().apiURl + '/ads'),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token'
  //       },
  //       body: jsonEncode({
  //         "title": _newAdTitleCtrl.text,
  //         "price": _newAdPriceCtrl.text,
  //         "mobile": _newAdNumberCtrl.text,
  //         "description": _newAdDescriptionCtrl.text,
  //         "images": _imagesURL
  //       }),
  //     );

  //     var _request = jsonDecode(respon.body);
  //     print(_request);
  //     var temp = jsonDecode(respon.body);
  //     if (temp["status"] == true) {
  //       Get.offAll(ListOfApps());
  //     }

  //     return _request;
  //   } catch (error) {
  //     return error;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Create Ad",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: _imagesURL != null
                        ? GestureDetector(
                            onTap: () {
                              // PickMultipleImages();
                              uploadImage();
                            },
                            child: Container(
                                height: 150,
                                width: 150,
                                child: Image.network(_imagesURL[0])),
                          )
                        : Container(
                            height: 150,
                            width: 150,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1.0, color: Colors.grey)),
                              onPressed: () {
                                // PickMultipleImages();
                                uploadImage();
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 54,
                                    color: Colors.grey[700],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      "Tap to upload",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                myTextField(
                  myControler: _newAdTitleCtrl,
                  myTextInput: TextInputType.text,
                  title: "Title",
                ),
                myTextField(
                  myControler: _newAdPriceCtrl,
                  myTextInput: TextInputType.number,
                  title: "Price",
                ),
                myTextField(
                  myControler: _newAdNumberCtrl,
                  myTextInput: TextInputType.number,
                  title: "Contact Number",
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _newAdDescriptionCtrl,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 70),
                        labelText: "Description",
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 22, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Submit Ad",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        _adsController.addNewAd(
                            _newAdTitleCtrl.text,
                            _newAdPriceCtrl.text,
                            _newAdNumberCtrl.text,
                            _newAdDescriptionCtrl.text,
                            _imageURL);

                        // setState(() {
                        //   if (wasadded == true) {
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text("new ad added"),
                        //       duration: Duration(seconds: 2),
                        //     ));
                        //   }
                        // });

                        // uploadAd();
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
