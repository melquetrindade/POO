import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var dataCervejas = [
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {
    "nome": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "nome": "Duvel",
    "style": "Pilsner",
    "ibu": "82"
  },
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {
    "nome": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "nome": "Duvel",
    "style": "Pilsner",
    "ibu": "82"
  },
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {
    "nome": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "nome": "Duvel",
    "style": "Pilsner",
    "ibu": "82"
  },
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {
    "nome": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "nome": "Duvel",
    "style": "Pilsner",
    "ibu": "82"
  },
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {
    "nome": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "nome": "Duvel",
    "style": "Pilsner",
    "ibu": "82"
  }
];

class NewAppBar extends AppBar {
  NewAppBar({super.title, super.key})
      : super(actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(value: 0, child: Text("Azul")),
              PopupMenuItem<int>(value: 1, child: Text("Vermelho"))
            ];
          })
        ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: NewAppBar(
            title: Center(child: Text("Dicas")),
          ),
          body: DataBodyWidget(cerveja: dataCervejas,),
          bottomNavigationBar: NewNavBar(objects: const [
            Icon(Icons.coffee_outlined),
            Icon(Icons.local_drink_outlined),
            Icon(Icons.flag_outlined)
          ]),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<Icon> objects;
  NewNavBar({this.objects = const []});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: botaoFoiTocado,
        items: objects
            .map((obj) => BottomNavigationBarItem(icon: obj, label: 'Botão'))
            .toList());
  }
}

class DataBodyWidget extends StatelessWidget {
  List cerveja;
  DataBodyWidget(
      {this.cerveja = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cerveja.length,
        itemBuilder: (context, i) {
          var cervejas = cerveja[i];
          return ListTile(
            leading: Icon(Icons.local_drink_outlined),
            title: Text(cervejas["nome"]),
            subtitle: Text("Estilo: " +
                cervejas["style"] +
                "\n" "IBU: " +
                cervejas["ibu"]),
          );
        });
  }
}
