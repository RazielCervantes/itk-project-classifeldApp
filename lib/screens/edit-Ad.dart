import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:itk_project_classified_app/screens/edit-Ad.dart';
import 'package:itk_project_classified_app/controllers/ads.dart';

import 'package:image_picker/image_picker.dart';
import 'package:itk_project_classified_app/screens/ads_listing.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/widgets/List-Product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/constans.dart';
// import 'package:itk_project_classified_app/global.dart';

class EditAd extends StatefulWidget {
  final String productName;
  final String productCost;
  final String number;
  final String productDescrip;
  final String addImages;
  final String productid;
  EditAd({
    Key? key,
    required this.productName,
    required this.productCost,
    required this.number,
    required this.productDescrip,
    required this.addImages,
    required this.productid,
  }) : super(key: key);

  @override
  State<EditAd> createState() => _EditAdState();
}

class _EditAdState extends State<EditAd> {
  // DataTextField myvar = DataTextField();
  PublishProducts data = PublishProducts();

  final AdsController _adsController = Get.put(AdsController());

  late final TextEditingController _editAdTitleCtrl =
      TextEditingController(text: this.widget.productName.toString());

  late final TextEditingController _editAdPriceCtrl =
      TextEditingController(text: this.widget.productCost.toString());

  late final TextEditingController _editAdContactCtrl =
      TextEditingController(text: this.widget.number.toString());

  late final TextEditingController _editAdDescriptionCtrl =
      TextEditingController(text: this.widget.productDescrip.toString());

  final box = GetStorage();

  var _imagesURL;

  final String _defaulImg =
      "https://images.assetsdelivery.com/compings_v2/pavelstasevich/pavelstasevich1811/pavelstasevich181101027.jpg";

  // PickMultipleImages() async {
  //   try {
  //     var images = await ImagePicker().pickMultiImage();
  //     if (images != null) {
  //       //upload images
  //       var request = http.MultipartRequest(
  //           "POST", Uri.parse(constans().apiURl + '/upload/photos'));
  //       images.forEach((images) async {
  //         request.files
  //             .add(await http.MultipartFile.fromPath('photos', images.path));
  //       });
  //       var res = await request.send();
  //       var respData = await res.stream.toBytes();
  //       var respStr = String.fromCharCodes(respData);
  //       var jsonObj = json.decode(respStr);
  //       print(jsonObj["data"]["path"]);
  //       setState(() {
  //         _imagesURL = (jsonObj["data"]["path"]);
  //       });
  //     } else {
  //       print("no image picked");
  //       _imagesURL = widget.addImages;
  //       print(_imagesURL);
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  // Future adEdit() async {
  //   var token = await box.read("token");
  //   var respon = await http.patch(
  //     Uri.parse(constans().apiURl + '/ads/${widget.productid}'),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //     body: jsonEncode({
  //       "title": _editAdTitleCtrl.text,
  //       "price": _editAdPriceCtrl.text,
  //       "mobile": _editAdContactCtrl.text,
  //       "description": _editAdDescriptionCtrl.text,
  //       "images": _imagesURL,
  //     }),
  //   );

  //   var _request = jsonDecode(respon.body);
  //   var temp = jsonDecode(respon.body);
  //   if (temp["status"] == true) {
  //     Get.to(ListOfApps());
  //   }

  //   return _request;
  // }

  @override
  void initState() {
    // _imagesURL = widget.addImages;
    // TODO: implement initState
    super.initState();
  }

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
              "Edit Ad",
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
                    child: Container(
                      height: 150,
                      width: 150,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1.0, color: Colors.grey)),
                        onPressed: () {
                          // PickMultipleImages();
                          print(widget.productid);
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.network(
                                // "${widget.addImages}",
                                _defaulImg,
                                fit: BoxFit.contain,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                      child: Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.network(
                                // "${widget.addImages}",
                                _defaulImg,
                                fit: BoxFit.contain,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                      child: Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.network(
                                // "${widget.addImages}",
                                _defaulImg,
                                fit: BoxFit.contain,
                              ))),
                    ),
                  ],
                ),
                myTextField(
                  myControler: _editAdTitleCtrl,
                  myTextInput: TextInputType.text,
                ),
                myTextField(
                  myControler: _editAdPriceCtrl,
                  myTextInput: TextInputType.number,
                ),
                myTextField(
                  myControler: _editAdContactCtrl,
                  myTextInput: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _editAdDescriptionCtrl,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 70),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.grey)),
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
                      onPressed: () async {
                        _adsController.UpdateMyAds(
                            widget.productid,
                            _editAdTitleCtrl.text,
                            _editAdPriceCtrl.text,
                            _editAdContactCtrl.text,
                            _editAdDescriptionCtrl.text);
                        // await adEdit();
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
