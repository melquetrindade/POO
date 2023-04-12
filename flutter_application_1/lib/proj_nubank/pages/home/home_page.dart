import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/proj_nubank/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  int pagAtual = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _pageController = PageController(initialPage: pagAtual);
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
              });
            },
          ),
          Positioned(
            top: _screenHeigth * 0.14,
            height: _screenHeigth * 0.55,
            left: 0,
            right: 0,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  color: Colors.white,
                ),
                Container(
                  color: Colors.lime,
                ),
                Container(
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
