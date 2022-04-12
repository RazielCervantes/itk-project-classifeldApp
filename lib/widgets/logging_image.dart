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
              child: Image.asset("images/city.jpg", fit: BoxFit.cover)),
          Center(
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(30)),
                const Icon(
                  Icons.business_outlined,
                  size: 100,
                  color: Colors.white,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "CLASSIFIED APP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "SELL ANYTHING INSTANTLY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
