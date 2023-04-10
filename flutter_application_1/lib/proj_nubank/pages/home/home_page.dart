import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/proj_nubank/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(),
        ],
      ),
    );
  }
}
