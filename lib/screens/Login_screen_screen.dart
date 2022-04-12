import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/screens/Ads.listing.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/global.dart';
import 'package:get/get.dart';
import 'package:itk_project_classified_app/widgets/logging_image.dart';
import 'package:itk_project_classified_app/screens/New-User2.dart';
import 'package:itk_project_classified_app/screens/Edit-Profile4.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:itk_project_classified_app/screens/index.dart';

class Loging extends StatelessWidget {
  Loging({Key? key}) : super(key: key);

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
                const LogingImage(),
                const SizedBox(
                  height: 12,
                ),
                myTextField(
                  myControler: myvar.useremailctrl,
                  myTextInput: TextInputType.emailAddress,
                  title: "Email Address",
                ),
                myTextField(
                  myControler: myvar.userpasswordctrl,
                  myTextInput: TextInputType.visiblePassword,
                  isPassword: true,
                  title: "Password",
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Get.to(ListOfApps());
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Don't have any account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Get.to(newUser());
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
