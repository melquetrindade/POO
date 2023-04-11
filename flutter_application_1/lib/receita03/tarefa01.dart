import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: Center(
            child: DataBodyWidget(objetos: [
              "La Fin Du Monde - Bock - 65 ibu",
              "Sapporo Premiume - Sour Ale - 54 ibu",
              "Duvel - Pilsner - 82 ibu"
            ]),
          ),
          bottomNavigationBar: NewNavBar(objects: [Icon(Icons.coffee_outlined), Icon(Icons.local_drink_outlined), Icon(Icons.flag_outlined)]),
        ));
  }
}
/*
class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}
*/

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
        items: objects.map((obj) => BottomNavigationBarItem(icon: obj, label: 'Botão'))
            .toList());
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objetos;
  DataBodyWidget({this.objetos = const []});

  @override
  Widget build(BuildContext context) {
    return Column(children: objetos.map((obj) => Expanded(child: Text("$obj"))).toList());
  }
}
