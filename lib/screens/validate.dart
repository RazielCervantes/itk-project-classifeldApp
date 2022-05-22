import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/screens/ads_listing.dart';
import 'package:itk_project_classified_app/screens/login-screen-screen.dart';

class ValidateScreen extends StatefulWidget {
  ValidateScreen({Key? key}) : super(key: key);

  @override
  State<ValidateScreen> createState() => _ValidateScreenState();
}

class _ValidateScreenState extends State<ValidateScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    validateLogged();
  }

  validateLogged() {
    FirebaseAuth.instance.authStateChanges().listen((User) {
      if (User != null) {
        setState(() {
          _isLoggedIn = true;
        });
      } else {
        setState(() {
          _isLoggedIn = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? ListOfApps() : Loging();
  }
}
