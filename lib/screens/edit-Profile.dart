import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:itk_project_classified_app/global.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/screens/login-screen-screen.dart';
import 'package:itk_project_classified_app/screens/my-Publish-Ads.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  DataTextField myvar = DataTextField();
  final MyGlbControllers _myGlbControllers = Get.put(MyGlbControllers());

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
              "Edit Profile",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(22),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/profilepicture.jpg"),
                      radius: 60,
                    ),
                  ),
                ),
                myTextField(
                    myControler: myvar.editnamectrl,
                    myTextInput: TextInputType.name,
                    title: null,
                    mmyHinttext: myvar.strg_usernamectrl),
                myTextField(
                  myControler: myvar.editemailctrl,
                  myTextInput: TextInputType.emailAddress,
                  title: null,
                  mmyHinttext: myvar.strg_useremailctrl,
                ),
                myTextField(
                  myControler: myvar.editmobilectrl,
                  myTextInput: TextInputType.number,
                  title: null,
                  mmyHinttext: myvar.strg_usermobilectrl,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        _myGlbControllers.userNameCtr.value =
                            myvar.editnamectrl.text;
                        // myvar.strg_usernamectrl = myvar.editnamectrl.text;
                        // Get.to();
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Logout",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Get.to(Loging());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
