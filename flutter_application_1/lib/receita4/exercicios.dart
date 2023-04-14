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

var dataCafe = [
  {"nome": "raquel", "style": "Bock", "ibu": "65"},
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
  {"nome": "melque", "style": "Pilsner", "ibu": "82"}
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
          body: DataBodyWidget(objetos: dataCervejas),
          bottomNavigationBar: NewNavBar(objects: [
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
  List objetos;
  DataBodyWidget({this.objetos = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: objetos.length,
        itemBuilder: (context, i) {
          var cervejas = objetos[i];
          var avatar =
              CircleAvatar(backgroundColor: Colors.blue,);
          return ListTile(
            leading: avatar,
            title: Text(cervejas["nome"]),
            subtitle: Text("Estilo: " +
                cervejas["style"] +
                "\n"
                    "IBU: " +
                cervejas["ibu"]),
          );
        });
  }
}

/*
class DataBodyWidget extends StatelessWidget {
  List objetos;
  DataBodyWidget({this.objetos = const []});

  @override
  Widget build(BuildContext context) {

    var columnNames = ["Nome","Estilo","IBU"],

        propertyNames = ["nome", "style", "ibu"];

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: DataTable(
          columns:
            columnNames.map((
              name) => DataColumn(
                label: Expanded(
                  child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))
                )
              )
            ).toList()
          ,
          rows: objetos.map((e) => DataRow(
            cells: propertyNames.map((propNames) => DataCell(Text(e[propNames]))).toList()
            )).toList()
        ),
      ),
    );
  }
}
*/