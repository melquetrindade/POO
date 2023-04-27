import 'package:flutter/material.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  List<String> columnsNames = [""];
  List<String> propertyNames = [""];

  void carregar(index) {
    if (index == 1) {
      carregarCervejas();
      columnsNames = ["Nome", "Estilo", "IBU"];
      propertyNames = ["name", "style", "ibu"];
    } else if (index == 2) {
      carregarPaises();
      columnsNames = ["Nome", "População", "Moeda"];
      propertyNames = ["nome", "populacao", "moeda"];
    } else {
      carregarCafes();
      columnsNames = ["Nome", "Descrisão", "Extra"];
      propertyNames = ["nome", "descrisao", "extra"];
    }
  }

  void carregarCervejas() {
    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
    ];
  }

  void carregarPaises() {
    tableStateNotifier.value = [
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
  }

  void carregarCafes() {
    tableStateNotifier.value = [
      {"nome": "Expresso", "descrisao": "Café Preto", "extra": "-"},
      {"nome": "Americano", "descrisao": "Café Fraco", "extra": "-"},
      {"nome": "Machiatto", "descrisao": "Café com chantilly", "extra": "-"},
      {
        "nome": "Expresso Panna",
        "descrisao": "Café com creme batido",
        "extra": "-"
      },
      {
        "nome": "Irlandês",
        "descrisao": "Café com whisky e creme batido",
        "extra": "-"
      },
      {"nome": "Árabe", "descrisao": "Café com especialista", "extra": "-"},
      {"nome": "Cortado", "descrisao": "Café com pouco de leite", "extra": "-"},
      {"nome": "Expresso", "descrisao": "Café Preto", "extra": "-"},
      {"nome": "Americano", "descrisao": "Café Fraco", "extra": "-"},
      {"nome": "Machiatto", "descrisao": "Café com chantilly", "extra": "-"},
      {
        "nome": "Expresso Panna",
        "descrisao": "Café com creme batido",
        "extra": "-"
      },
      {
        "nome": "Irlandês",
        "descrisao": "Café com whisky e creme batido",
        "extra": "-"
      },
      {"nome": "Árabe", "descrisao": "Café com especialista", "extra": "-"},
      {"nome": "Cortado", "descrisao": "Café com pouco de leite", "extra": "-"}
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();
  runApp(app);
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
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(
                    jsonObjects: value,
                    propertyNames: dataService.propertyNames,
                    columnNames: dataService.columnsNames);
              }),
          bottomNavigationBar: NewNavBar(
            itemSelectedCallback: dataService.carregar,
          ),
        ));
  }
}

class NewNavBar extends StatefulWidget {

  var itemSelectedCallback;

  NewNavBar({Key? key,this.itemSelectedCallback}) : super(key: key);

  @override
  _NewNavBarState createState() => _NewNavBarState();
}

class _NewNavBarState extends State<NewNavBar>{
  var state = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            state = index;
            widget.itemSelectedCallback(index);
          });
        },
        currentIndex: state,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["nome", "populacao", "moeda"]});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
