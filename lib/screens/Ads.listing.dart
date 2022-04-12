import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/widgets/List-Product.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/screens/Create-Ad.dart';
import 'package:itk_project_classified_app/screens/Check-Product.dart';
import 'package:itk_project_classified_app/screens/Page-Settings10.dart';

PublishProducts data = PublishProducts();

List<dynamic> TheProducts2 = [
  {
    "product": "Samsung A1",
    "cost": "400",
    "contact": "2",
    "Image": "images/producto1.jpg",
    "description": "its a cellular"
  },
  {
    "product": "Laptop",
    "cost": "999",
    "time": "5",
    "Image": "images/2.jpg",
    "description": "its a laptop"
  },
  {
    "product": "AirPods",
    "cost": "999",
    "contact": "8 ",
    "Image": "images/producto3.jpg",
    "description": "its an airpod"
  },
  {
    "product": "Imac",
    "cost": "11900",
    "contact": "10 ",
    "Image": "images/producto4.jpg",
    "description": "its a mac"
  },
  {
    "product": "moto G5",
    "cost": "200",
    "contact": "12",
    "Image": "images/producto5.jpg",
    "description": "its a cellular"
  },
  {
    "product": "Yeti Mic",
    "cost": "876",
    "contact": "15 ",
    "Image": "images/producto6.jpg",
    "description": "its a mic"
  },
  {
    "product": "Alexa 4th Gen",
    "cost": "600",
    "contact": "14",
    "Image": "images/producto7.jpg",
    "description": "its an assistan"
  },
  {
    "product": "LED Strip",
    "cost": "223",
    "contact": "20 ",
    "Image": "images/producto8.jpg",
    "description": "its a led"
  },
];

class ListOfApps extends StatelessWidget {
  const ListOfApps({Key? key}) : super(key: key);

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
                crossAxisCount: 2, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
            itemCount: data.TheProducts.length,
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
      Get.to(CheckProd());
    },
    child: Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            TheProducts2["Image"],
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 50,
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
                    Text(
                      TheProducts2["product"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "\$ " + TheProducts2["cost"],
                      style: TextStyle(color: Colors.orange, fontSize: 12),
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