import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/proj_nubank/pages/home/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nubank desing inspiration",
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
