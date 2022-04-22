import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/widgets/List-Product.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/create-Ad.dart';
import 'package:itk_project_classified_app/screens/check-Product.dart';
import 'package:itk_project_classified_app/screens/page-Settings.dart';

PublishProducts data = PublishProducts();

List<dynamic> TheProducts2 = [
  {
    "product": "Samsung For sale",
    "cost": "12000.0",
    "contact": "84253",
    "time": "8",
    "Image": "images/mobile_3.jpg",
    "description":
        "its a celular. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit."
  },
  {
    "product": "iPhone For Sale",
    "cost": "33000.0",
    "contact": "84253",
    "time": "18",
    "Image": "images/mobile_1.jpg",
    "description":
        "its a Iphone. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit."
  },
  {
    "product": "maruti swift 2020 for sale",
    "cost": "999",
    "contact": "300000.0 ",
    "time": "18",
    "Image": "images/car_2.jpg",
    "description":
        "its an swift. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit. "
  },
  {
    "product": "Farm Land near Chennai",
    "cost": "120000.0",
    "contact": "104245 ",
    "time": "18",
    "Image": "images/hourse_1.png",
    "description":
        "its a farm. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit."
  },
  {
    "product": "Used Benz for Sale",
    "cost": "500000.0",
    "contact": "1432422",
    "time": "18",
    "Image": "images/car_1.jpg",
    "description":
        "its a car. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum, nisi feugiat placerat laoreet, libero justo ornare sem, vitae fermentum est leo vel velit. "
  },
  {
    "product": "Used Macbook Pro for sale",
    "cost": "45000.0",
    "contact": "14 ",
    "time": "18",
    "Image": "images/apple-macbook-pro-m1.jpg",
    "description":
        "Used mac 2012 for sale with good quality. 500 GB, 8GB RAM. Space Grey. Mid 2012 modal. includes Charger"
  },
];

class ListOfApps extends StatelessWidget {
  // final String product;
  // final double cost;
  // final double time;
  // final String Image;

  const ListOfApps({
    Key? key,
    // required this.Image,
    // required this.product,
    // required this.cost,
    // required this.time,
  }) : super(key: key);

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
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/profilepicture.jpg"),
                )),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.8),
            itemCount: TheProducts2.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(4.0),
                  // child: buildItemGrid(data.TheProducts[index]));
                  child: buildItemGrid(TheProducts2[index]));
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
}

Widget buildItemGrid(Map TheProducts2) {
  return GestureDetector(
    onTap: () {
      Get.to(CheckProd(
        product: TheProducts2["product"],
        cost: TheProducts2["cost"],
        ImageUri: TheProducts2["Image"],
        time: TheProducts2["time"],
        description: TheProducts2["description"],
      ));
    },
    child: Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            TheProducts2["Image"],
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      child: Text(
                        TheProducts2["product"],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "\$ " + TheProducts2["cost"],
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//trying to use the map in class list-Product
// Widget buildItemGrid(Map) {
//   return GestureDetector(
//     onTap: () {
//       Get.to(Loging());
//     },
//     child: Stack(
//       children: [
//         SizedBox(
//           height: double.infinity,
//           width: double.infinity,
//           child: Image.asset(
//             data.TheProducts['Image'],
//             fit: BoxFit.cover,
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: Container(
//             height: 50,
//             color: Colors.black.withOpacity(0.5),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       data.TheProducts['product'],
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       "\$ " + data.TheProducts["cost"],
//                       style: TextStyle(color: Colors.orange, fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }