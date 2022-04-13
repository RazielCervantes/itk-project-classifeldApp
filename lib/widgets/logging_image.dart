import 'package:flutter/material.dart';

class LogingImage extends StatelessWidget {
  const LogingImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("images/background.jpg", fit: BoxFit.cover)),
          Center(
              child: SizedBox(
            width: 200,
            child: Image.asset("images/logo.png"),
          ))
        ],
      ),
    );
  }
}
