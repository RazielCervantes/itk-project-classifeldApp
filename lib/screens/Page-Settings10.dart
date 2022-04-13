import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/screens/Edit-Profile4.dart';
import 'package:itk_project_classified_app/screens/My-Publish-Ads.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/widgets/buttonssettings.dart';
import 'package:itk_project_classified_app/global.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  DataTextField myvar = DataTextField();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 15, 16, 12),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("images/profilepicture.jpg"),
                        radius: 24,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(myvar.strg_usernamectrl),
                        Text(
                          myvar.strg_usermobilectrl,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.orange),
                  ),
                  onPressed: () {
                    Get.to(EditProfile());
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(Ads());
                },
                child: Container(
                  height: 40,
                  width: 140,
                  child: Row(
                    children: [
                      Icon(Icons.post_add),
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Text("My Ads"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 140,
                  child: Row(
                    children: [
                      Icon(Icons.person_outline_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Text("About Us"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 140,
                child: Row(
                  children: [
                    Icon(Icons.contacts_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Text("Contact Us"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
