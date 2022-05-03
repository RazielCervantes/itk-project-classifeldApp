import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:itk_project_classified_app/screens/My-Publish-Ads.dart';
import 'package:itk_project_classified_app/screens/create-Ad.dart';
import 'package:itk_project_classified_app/screens/check-Product.dart';
import 'package:itk_project_classified_app/screens/my-Publish-Ads.dart';
import 'package:itk_project_classified_app/screens/page-Settings.dart';
import 'package:itk_project_classified_app/util/constans.dart';

class ListOfApps extends StatefulWidget {
  ListOfApps({
    Key? key,
  }) : super(key: key);

  @override
  State<ListOfApps> createState() => _ListOfAppsState();
}

class _ListOfAppsState extends State<ListOfApps> {
  final String _defaulImg =
      "https://images.assetsdelivery.com/compings_v2/pavelstasevich/pavelstasevich1811/pavelstasevich181101027.jpg";
  final MyGlbControllers _myGlbControllers = Get.put(MyGlbControllers());
  final box = GetStorage();

//request the info from the current user

  Future getProfileInfo() async {
    try {
      var token = box.read('token');
      var respon = await http.post(
        Uri.parse(constans().apiURl + '/user/profile'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      var _request = jsonDecode(respon.body);

      if (_request["status"] == true) {
        _myGlbControllers.userNameCtr.value = _request["data"]["name"];
        _myGlbControllers.userProfileEmailCtr.value = _request["data"]["email"];
        _myGlbControllers.userProfileMobileCtr.value =
            _request["data"]["mobile"];
        _myGlbControllers.userProfileImagectr.value =
            _request["data"]["imgURL"];
        _myGlbControllers.userProfileDatectr.value = _request["data"]["date"];
      }

      print(_request);
      return _request;
    } catch (error) {
      return error;
    }
  }

//request the ads published

  var _publishedAds; //Variable with a form of list to save the ads's information

  Future<String> getAdsInfo() async {
    var response = await http.get(
      Uri.parse(constans().apiURl + '/ads'),
      headers: {
        'Content-type': "application/json; charset=UTF-8",
        'Accept': 'application/json'
      },
    );
    setState(() {
      _publishedAds = jsonDecode(response.body);
    });

    return "success!";
  }

  @override
  void initState() {
    getAdsInfo();
    getProfileInfo();
    // TODO: implement initState
    super.initState();
  }

// structure of the screen

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ads listing",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(SettingsPage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Obx(() => CircleAvatar(
                        backgroundImage: NetworkImage(
                            _myGlbControllers.userProfileImagectr.value),
                      )),
                )),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          //building the gridview with the information of the list(_publishedAds) that was prevoius created

          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.8),
            itemCount: _publishedAds == null ? 0 : _publishedAds["data"].length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildItemGrid(_publishedAds["data"][index]));
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          backgroundColor: Colors.orange[900],
          onPressed: () {
            Get.to(CreateAd());
          },
        ),
      ),
    );
  }

//Making the layout of the GridView.builder

  @override
  Widget buildItemGrid(Map _publishedAds) {
    return GestureDetector(
      onTap: () async {
        Get.to(CheckProd(
          product: _publishedAds["title"],
          cost: _publishedAds["price"].toString(),
          ImageUri: _publishedAds["images"][0],
          time: _publishedAds["createdAt"],
          description: _publishedAds["description"],
          // sellercontact: _publishedAds["mobile"],
        ));

        //         testing
        // print(getProfileInfo());
        // print(_myGlbControllers.userNameCtr.toString());
        // print(_myGlbControllers.userProfileEmailCtr.toString());
        // print(_myGlbControllers.userProfileImagectr.toString());
        // print(_myGlbControllers.userProfileMobileCtr.toString());
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Image.network(
              _publishedAds["images"][0] == null
                  ? _defaulImg
                  : _publishedAds["images"][0],
              fit: BoxFit.fitHeight,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 80,
              color: Colors.black.withOpacity(0.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _publishedAds["title"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$ " + _publishedAds["price"].toString(),
                          style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
