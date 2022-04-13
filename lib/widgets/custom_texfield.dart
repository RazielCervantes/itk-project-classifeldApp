import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final TextEditingController myControler;
  final TextInputType myTextInput;
  final String? title;
  final bool isPassword;
  final String? mmyHinttext;

  const myTextField(
      {Key? key,
      required this.myControler,
      this.myTextInput = TextInputType.name,
      this.title = "title",
      this.isPassword = false,
      this.mmyHinttext = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: TextField(
        keyboardType: myTextInput,
        controller: myControler,
        obscureText: isPassword,
        decoration: InputDecoration(
            labelText: title,
            hintText: mmyHinttext,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            labelStyle: TextStyle(fontSize: 18, color: Colors.grey)),
      ),
    );
  }
}
