import 'package:flutter/material.dart';

class CheckImage extends StatelessWidget {
  final String imageProd;
  const CheckImage({Key? key, required this.imageProd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            height: 800,
            width: double.infinity,
            child: Image.network(
              imageProd,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
