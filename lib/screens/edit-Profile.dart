import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../util/constans.dart';
import 'package:itk_project_classified_app/controllers/mycontroller.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/screens/login-screen-screen.dart';
import 'package:itk_project_classified_app/controllers/profile.dart';

class EditProfile extends StatefulWidget {
  final String userfullName;
  final String userEmail;
  final String userNumber;
  final String userid;

  EditProfile(
      {Key? key,
      required this.userEmail,
      required this.userNumber,
      required this.userfullName,
      required this.userid})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final MyGlbControllers _myGlbControllers = Get.put(MyGlbControllers());

  final ProfileController _profileController = Get.put(ProfileController());

  late final TextEditingController _editUserNameCtrl =
      TextEditingController(text: this.widget.userfullName);

  late final TextEditingController _editUserEmailCtrl =
      TextEditingController(text: this.widget.userEmail);

  late final TextEditingController _editUserNumberCtrl =
      TextEditingController(text: this.widget.userNumber);

  late String _imageURL = _myGlbControllers.userProfileImagectr.toString();

  final box = GetStorage();

  PickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      //upload image
      var request = http.MultipartRequest(
          "POST", Uri.parse(constans().apiURl + '/upload/profile'));
      request.files
          .add(await http.MultipartFile.fromPath('avatar', image.path));
      var res = await request.send();
      var respData = await res.stream.toBytes();
      var respStr = String.fromCharCodes(respData);
      var jsonObj = json.decode(respStr);
      print(jsonObj["data"]["path"]);
      setState(() {
        _imageURL = jsonObj["data"]["path"];
      });
    } else {
      print("no image picked");
    }
  }

  Future profileEdit() async {
    try {
      var token = box.read("token");
      var respon = await http.patch(
        Uri.parse(constans().apiURl + '/user/'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          "name": _editUserNameCtrl.text,
          "email": _editUserEmailCtrl.text,
          "mobile": _editUserNumberCtrl.text,
          "imgURL": _imageURL,
        }),
      );

      var _request = jsonDecode(respon.body);
      print(_request);

      return _request;
    } catch (error) {
      return error;
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(Loging());
    });
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
                    child: Obx(
                      () => GestureDetector(
                          onTap: () {
                            PickImage();
                          },
                          child: _imageURL != ""
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(_imageURL),
                                  radius: 60.0,
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      _myGlbControllers
                                          .userProfileImagectr.value),
                                  radius: 60.0,
                                )),
                    ),
                  ),
                ),
                myTextField(
                  myControler: _editUserNameCtrl,
                  myTextInput: TextInputType.name,
                  title: "Name",
                ),
                myTextField(
                  myControler: _editUserEmailCtrl,
                  myTextInput: TextInputType.emailAddress,
                  title: "Email",
                ),
                myTextField(
                  myControler: _editUserNumberCtrl,
                  myTextInput: TextInputType.number,
                  title: "Mobile",
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
                      onPressed: () async {
                        // _profileController.UpdateMyProfile(
                        //     uid,
                        //     _editUserNameCtrl.text,
                        //     _editUserEmailCtrl.text,
                        //     _editUserNumberCtrl.text);
                        // var saveChanges = await profileEdit();
                        // if (saveChanges["status"] = true) {
                        //   _myGlbControllers.getProfileInfo();
                        //   showDialog(
                        //       context: context,
                        //       builder: (contex) => AlertDialog(
                        //             title: Text("Alert"),
                        //             content: Text("User profile updated "),
                        //             actions: <Widget>[
                        //               IconButton(
                        //                 icon: Icon(Icons.close),
                        //                 onPressed: () {
                        //                   Navigator.pop(contex);
                        //                 },
                        //               )
                        //             ],
                        //           ));
                        // }

                        _profileController.UpdateMyProfile(
                            widget.userid,
                            _editUserNameCtrl.text,
                            _editUserEmailCtrl.text,
                            _editUserNumberCtrl.text);
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
                    logout();
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
