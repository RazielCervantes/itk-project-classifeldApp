import 'package:flutter/material.dart';

class butSet extends StatelessWidget {
  const butSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 40,
        width: 140,
        color: Colors.amber,
        child: Row(
          children: [
            Icon(Icons.post_add),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("My Ads"),
            )
          ],
        ),
      ),
    );
  }
}
