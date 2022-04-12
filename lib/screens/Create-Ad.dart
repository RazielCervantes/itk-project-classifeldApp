import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/global.dart';

class CreateAd extends StatelessWidget {
  CreateAd({Key? key}) : super(key: key);

  DataTextField myvar = DataTextField();

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
              "Create Ad",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 150,
                      width: 150,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1.0, color: Colors.grey)),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 54,
                              color: Colors.grey[700],
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                "Tap to upload",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                myTextField(
                  myControler: myvar.newadtitle,
                  myTextInput: TextInputType.text,
                  title: "Title",
                ),
                myTextField(
                  myControler: myvar.newadprice,
                  myTextInput: TextInputType.number,
                  title: "Price",
                ),
                myTextField(
                  myControler: myvar.newadcontact,
                  myTextInput: TextInputType.number,
                  title: "Contact Number",
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: myvar.newaddescription,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 70),
                        labelText: "Description",
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 22, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      child: const Text(
                        "Submit Ad",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[900]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
