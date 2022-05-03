// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get_storage/get_storage.dart';

// import '../util/constans.dart';

// void main() => runApp(testingScreen());

// class testingScreen extends StatefulWidget {
//   @override
//   State<testingScreen> createState() => _testingScreenState();
// }

// class _testingScreenState extends State<testingScreen> {
//   final box = GetStorage();
//   List objApi = [];

//   Future fetchAds() async {
//     try {
//       var token = box.read('token');
//       var resp =
//           await http.post(Uri.parse(constans().apiURl + 'ads/user'), headers: {
//         'Content-type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $token'
//       });
//       var data = json.decode(resp.body);

//       // Validations
//       return data['data'];
//     } catch (e) {
//       return "Error";
//     }
//   }

//   Future getAdsFromApi() async {
//     var resp = await fetchAds();
//     setState(() {
//       objApi = resp;
//     });
//   }

//   @override
//   void initState() {
//     getAdsFromApi();
//     super.initState();
//   }
// //   var _publishedAds;

// // // making the HTTP request from the server

// //   Future getAdsInfo() async {
// //     try {
// //       var response = await http.get(Uri.parse(constans().apiURl + '/ads'),
// //           headers: {
// //             'Content-type': "application/json; charset=UTF-8",
// //             'Accept': 'application/json'
// //           });

// //       this.setState(() {
// //         _publishedAds = jsonDecode(response.body);
// //       });

// //       print(_publishedAds["data"][24]["mobile"]);

// //       return _publishedAds;
// //     } catch (err) {
// //       print(err);

// //       return ("error");
// //     }
// //   }

// //   @override
// //   void initState() {
// //     getAdsInfo();
// //     // TODO: implement initState
// //     super.initState();
// //   }

// //*********************************** */

//   // Map _publishedAds = {};

//   // Future<String> getAdsInfo() async {
//   //   var response = await http.get(
//   //     Uri.parse(constans().apiURl + "/ads"),
//   //     headers: {
//   //       'Content-type': "application/json; charset=UTF-8",
//   //       'Accept': 'application/json'
//   //     },
//   //   );
//   //   this.setState(() {
//   //     _publishedAds = jsonDecode(response.body);
//   //   });

//   //   print(_publishedAds["data"][22]["title"]);
//   //   return "success!";
//   // }

//   // @override
//   // void initState() {
//   //   this.getAdsInfo();
//   //   // TODO: implement initState
//   //   super.initState();
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Material App',
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Testing Screen'),
// //         ),
// //         body: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: SizedBox(
// //               height: 50,
// //               width: 350,
// //               child: ElevatedButton(
// //                 child: const Text(
// //                   "Test",
// //                   style: TextStyle(
// //                       fontSize: 18,
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.w600),
// //                 ),
// //                 onPressed: () {
// //                   getMyAds();
// //                   print(myads["data"]);
// //                 },
// //                 style: ElevatedButton.styleFrom(primary: Colors.orange[900]),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// //   var _publishedAds;

// // // making the HTTP request from the server

// //   Future getAdsInfo() async {
// //     try {
// //       var response = await http.get(Uri.parse(constans().apiURl + '/ads'),
// //           headers: {
// //             'Content-type': "application/json; charset=UTF-8",
// //             'Accept': 'application/json'
// //           });

// //       this.setState(() {
// //         _publishedAds = jsonDecode(response.body);
// //       });

// //       print(_publishedAds["data"][24]["mobile"]);

// //       return _publishedAds;
// //     } catch (err) {
// //       print(err);

// //       return ("error");
// //     }
// //   }

// //   @override
// //   void initState() {
// //     getAdsInfo();
// //     // TODO: implement initState
// //     super.initState();
// //   }