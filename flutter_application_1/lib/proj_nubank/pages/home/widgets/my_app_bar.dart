import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback onTap;

  const MyAppBar({Key? key, this.showMenu = false, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.network(
                    "assets/imgs/logo_3.png",
                    height: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Melque",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ]),
                Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
              ],
            ),
          ),
        )
      ],
    );
  }
}
