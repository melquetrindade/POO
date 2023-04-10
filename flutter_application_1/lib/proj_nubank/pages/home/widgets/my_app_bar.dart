import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Container(
          color: Colors.blue,
          height: 200,
          child: Row(children: [
            Image.network("assets/imgs/logo_3.png",
              height: 35,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Melque", 
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
              ),
            )
          ]),
        )
      ],
    );
  }
}
