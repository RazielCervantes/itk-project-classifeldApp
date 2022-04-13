import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/screens/Ads.listing.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/global.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/widgets/logging_image.dart';
import 'package:itk_project_classified_app/screens/Login_screen_screen.dart';

class newUser extends StatelessWidget {
  newUser({Key? key}) : super(key: key);

  DataTextField myvar = DataTextField();

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
                LogingImage(),
                SizedBox(height: 12),
                myTextField(
                  myControler: myvar.newusernamectrl,
                  myTextInput: TextInputType.name,
                  title: "Full Name",
                ),
                myTextField(
                  myControler: myvar.newuseremailctrl,
                  myTextInput: TextInputType.emailAddress,
                  title: "Email Address",
                ),
                myTextField(
                  myControler: myvar.newusermobilectrl,
                  myTextInput: TextInputType.number,
                  title: "Mobile Number",
                ),
                myTextField(
                  myControler: myvar.newuserpasswordctrl,
                  myTextInput: TextInputType.visiblePassword,
                  title: "Password",
                  isPassword: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        // myvar.strg_usernamectrl = myvar.newusernamectrl.text;
                        // myvar.strg_useremailctrl = myvar.newuseremailctrl.text;
                        // myvar.strg_usermobilectrl =
                        //     myvar.newusermobilectrl.text;
                        // myvar.strg_userpasswordctrl =
                        //     myvar.newuserpasswordctrl.text;

                        Get.to(ListOfApps());
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Alredy have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Get.to(Loging());
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
