import 'package:flutter/material.dart';
import 'package:itk_project_classified_app/widgets/custom_texfield.dart';
import 'package:itk_project_classified_app/global.dart';
import 'package:itk_project_classified_app/widgets/List-Product.dart';

class EditAd extends StatelessWidget {
  EditAd({Key? key}) : super(key: key);

  DataTextField myvar = DataTextField();
  PublishProducts data = PublishProducts();

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
              "Edit Ad",
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(
                                "images/apple-macbook-pro-m1.jpg",
                                fit: BoxFit.contain,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                      child: Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(
                                "images/apple-macbook-pro-m1.jpg",
                                fit: BoxFit.contain,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                      child: Container(
                          height: 74,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(
                                "images/apple-macbook-pro-m1.jpg",
                                fit: BoxFit.contain,
                              ))),
                    ),
                  ],
                ),
                myTextField(
                  myControler: myvar.editadtitle,
                  myTextInput: TextInputType.text,
                  title: null,
                  mmyHinttext: "Used Macbook Pro for sale",
                ),
                myTextField(
                  myControler: myvar.editadprice,
                  myTextInput: TextInputType.number,
                  title: null,
                  mmyHinttext: "45000.0",
                ),
                myTextField(
                  myControler: myvar.editadcontact,
                  myTextInput: TextInputType.number,
                  title: null,
                  mmyHinttext: "+91988643210",
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: myvar.editaddescription,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 70),
                        labelText: null,
                        hintText:
                            "Used mac 2012 for sale with good quality. 500 GB, 8GB RAM. Space Grey. Mid 2012 modal. includes Charger",
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.grey)),
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
