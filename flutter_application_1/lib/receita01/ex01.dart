//Aluno: Melque Rodrigues da Trindade

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// NewNavBar (List<Icon> this.icons);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _opSelect = 0;
  int _buttonBar = 0;
  String _imgEl =
      "https://upload.wikimedia.org/wikipedia/en/9/90/The_DuckDuckGo_Duck.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text("Meu Portfólio",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pokemon',
                  )),
            ),
            backgroundColor: Colors.blue.shade900,
          ),
          body: Center(
            child: Column(children: [
              const Text(
                "\nImagens:\n",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pokemon',
                ),
              ),
              Stack(
                children: [
                  FadeInImage.assetNetwork(
                    width: 200,
                    height: 200,
                    placeholder: "assets/imgs/fotodia.png",
                    image: "$_imgEl",
                    fadeInDuration: const Duration(milliseconds: 500),
                    fadeInCurve: Curves.easeIn,
                    //fit: BoxFit.cover,
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Melque",
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pokemon',
                    ),
                  ),
                  Text(
                    "Rodrigues",
                    style: TextStyle(
                      color: Color.fromARGB(255, 222, 109, 22),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pokemon',
                    ),
                  ),
                  Text(
                    "da",
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 216, 17),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pokemon',
                    ),
                  ),
                  Text(
                    "Trindade",
                    style: TextStyle(
                      color: Color.fromRGBO(174, 32, 235, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pokemon',
                    ),
                  ),
                  Text(
                    "Santos",
                    style: TextStyle(
                      color: Color.fromARGB(255, 213, 8, 8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pokemon',
                    ),
                  )
                ],
              ),
              Container(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    _opSelect++;
                    setState(() {
                      if (_opSelect == 0) {
                        _imgEl =
                            "https://upload.wikimedia.org/wikipedia/en/9/90/The_DuckDuckGo_Duck.png";
                      } else if (_opSelect == 1) {
                        _imgEl =
                            "https://fastly.picsum.photos/id/78/1584/2376.jpg?hmac=80UVSwpa9Nfcq7sQ5kxb9Z5sD2oLsbd5zkFO5ybMC4E";
                      } else {
                        _opSelect = -1;
                        _imgEl =
                            "https://cdn.pixabay.com/photo/2017/09/01/00/16/png-2702697_1280.png";
                      }
                    });

                    print("butoon num: $_opSelect");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_forward),
                      Text(
                        "Passar Imagem",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _buttonBar,
              onTap: (op) {
                setState(() {
                  if (op == 0) {
                    _buttonBar = op;
                    print("Clicou no Home");
                  } else if (op == 1) {
                    _buttonBar = op;
                    print("Clicou no Perfil");
                  } else {
                    _buttonBar = op;
                    print("Clicou no Pesquisar");
                  }
                });
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Perfil",
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: "Pesquisar",
                  icon: Icon(Icons.search),
                )
              ]),
        ));
  }
}
