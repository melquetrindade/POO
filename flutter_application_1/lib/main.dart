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
  String _imgEl =
      "https://www.imagensempng.com.br/wp-content/uploads/2021/05/Homem-Aranha-Parede-Png-1024x1024.png";

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
                "\nProjetos\n\n",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pokemon',
                ),
              ),
              /*
          Container(
          //color: Color.fromARGB(125, 109, 251, 114),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://fastly.picsum.photos/id/78/1584/2376.jpg?hmac=80UVSwpa9Nfcq7sQ5kxb9Z5sD2oLsbd5zkFO5ybMC4E"),
              fit: BoxFit.cover,
            )
          )
          ),*/
              Container(
                width: 200,
                height: 200,
                child: Image.network("$_imgEl"),
              ),
              Text(
                "Calculadora IMC\n",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pokemon',
                ),
              ),
              Text(
                "Encontra CEP\n",
                style: TextStyle(
                  color: Color.fromARGB(255, 167, 223, 55),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pokemon',
                ),
              ),
              Text(
                "Clone Ifood",
                style: TextStyle(
                  color: Color.fromARGB(255, 40, 216, 17),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pokemon',
                ),
              )
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _opSelect,
              onTap: (op) {
                print("Botão: $op");

                setState(() {
                  if (op == 0) {
                    _opSelect = op;
                    _imgEl =
                        "https://www.imagensempng.com.br/wp-content/uploads/2021/05/Homem-Aranha-Parede-Png-1024x1024.png";
                  } else if (op == 1) {
                    _opSelect = op;
                    _imgEl =
                        "https://fastly.picsum.photos/id/78/1584/2376.jpg?hmac=80UVSwpa9Nfcq7sQ5kxb9Z5sD2oLsbd5zkFO5ybMC4E";
                  } else {
                    _opSelect = op;
                    _imgEl =
                        "https://www.imagensempng.com.br/wp-content/uploads/2023/02/Icones-Instagram-Png-300x300.png";
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
