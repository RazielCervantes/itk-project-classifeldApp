import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final TextEditingController myControler;
  final TextInputType myTextInput;
  final String? title;
  final bool isPassword;

  const myTextField({
    Key? key,
    required this.myControler,
    this.myTextInput = TextInputType.name,
    this.title = "title",
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: myTextInput,
        controller: myControler,
        obscureText: isPassword,
        decoration: InputDecoration(
            labelText: title,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            labelStyle: TextStyle(fontSize: 22, color: Colors.grey)),
      ),
    );
  }
}
