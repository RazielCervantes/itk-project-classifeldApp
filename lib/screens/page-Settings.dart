import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:itk_project_classified_app/screens/edit-Profile.dart';
import 'package:itk_project_classified_app/screens/my-Publish-Ads.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/controllers/profile.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final MyGlbControllers _myGlbControllers = Get.put(MyGlbControllers());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _profileController.getAccountInfo();
  }

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
                      child: Obx(
                        () => CircleAvatar(
                          backgroundImage: NetworkImage(
                              _profileController.accountsInfo[0]["imageURL"]),
                          radius: 24,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(_profileController.accountsInfo[0] ==
                                null
                            ? "user name"
                            : _profileController.accountsInfo[0]["fullname"])),
                        Obx(
                          () => Text(
                            _profileController.accountsInfo[0] == null
                                ? "user mobile"
                                : _profileController.accountsInfo[0]["mobile"],
                            style: TextStyle(color: Colors.grey),
                          ),
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
                    // Get.to(EditProfile());
                    print("click");
                    Get.to(EditProfile(
                      userEmail: _profileController.accountsInfo[0]["email"],
                      userNumber: _profileController.accountsInfo[0]["mobile"],
                      userfullName: _profileController.accountsInfo[0]
                          ["fullname"],
                      userid: _profileController.accountsInfo[0]["userId"],
                      profileImage: _profileController.accountsInfo[0]
                          ["imageURL"],
                    ));
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(Ads());

                  // _adsController.getMyAds();
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
