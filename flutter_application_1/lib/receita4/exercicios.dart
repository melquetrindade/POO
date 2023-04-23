import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var dataCervejas = [
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"nome": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"nome": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"nome": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"nome": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"nome": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"nome": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"nome": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"nome": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"nome": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"nome": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"nome": "Duvel", "style": "Pilsner", "ibu": "82"}
];

var dataPaises = [
  {"nome": "Brasil", "populacao": "214,3 milhões", "moeda": "Real"},
  {"nome": "Argentina", "populacao": "45,81 milhões", "moeda": "Peso"},
  {"nome": "Alemanha", "populacao": "83,2 milhões", "moeda": "Euro"},
  {"nome": "França", "populacao": "67,75 milhões", "moeda": "Euro"},
  {"nome": "China", "populacao": "1,412 bilhão", "moeda": "Yuan"},
  {"nome": "EUA", "populacao": "331,9 milhões", "moeda": "Dolár"},
  {"nome": "México", "populacao": "126,7 milhões", "moeda": "Peso"},
  {"nome": "Brasil", "populacao": "214,3 milhões", "moeda": "Real"},
  {"nome": "Argentina", "populacao": "45,81 milhões", "moeda": "Peso"},
  {"nome": "Alemanha", "populacao": "83,2 milhões", "moeda": "Euro"},
  {"nome": "França", "populacao": "67,75 milhões", "moeda": "Euro"},
  {"nome": "China", "populacao": "1,412 bilhão", "moeda": "Yuan"},
  {"nome": "EUA", "populacao": "331,9 milhões", "moeda": "Dolár"},
  {"nome": "México", "populacao": "126,7 milhões", "moeda": "Peso"},
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
          body: DataBodyWidget(
            objData: dataPaises,
            columnNames: ["Nome", "População", "Moeda"],
            propertyNames: ["nome", "populacao", "moeda"],
            icon: Icon(Icons.flag_outlined),
          ),
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
  List objData;
  List<String> columnNames;
  List<String> propertyNames;
  Icon icon;
  DataBodyWidget(
      {required this.objData,
      required this.columnNames,
      required this.propertyNames,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: objData.length,
        itemBuilder: (context, i) {
          var objeto = objData[i];
          return ListTile(
            leading: icon,
            title: Text(objeto[propertyNames[0]]),
            subtitle: Text(columnNames[1] +
                ": " +
                objeto[propertyNames[1]] +
                "\n" +
                columnNames[2] +
                ": " +
                objeto[propertyNames[2]]),
          );
        });
  }
}