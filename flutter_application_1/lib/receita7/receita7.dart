import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:convert';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  List<String> columnsNames = [""];
  List<String> propertyNames = [""];

  void carregar(index, qtd) {
    if (index == 0){
      carregarCafes(qtd);
      columnsNames = ["Nome", "Origem", "Variedade"];
      propertyNames = ["blend_name", "origin", "variety"];
    }
    else if (index == 1){
      carregarCervejas(qtd);
      columnsNames = ["Nome", "Estilo", "IBU"];
      propertyNames = ["name", "style", "ibu"];
    }
    else{
      carregarNacoes(qtd);
      columnsNames = ["Nacionalidade", "Capital", "Esporte Nacional"];
      propertyNames = ["nationality", "capital", "national_sport"];
    }
  }

  Future<void> carregarNacoes(qtd) async {
    var nacoesUri = Uri(
        scheme: 'http',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': qtd});

    var jsonString = await http.read(nacoesUri);
    var nacoesJson = jsonDecode(jsonString);
    tableStateNotifier.value = nacoesJson;
  }

  Future<void> carregarCervejas(qtd) async {

    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': qtd});

    var jsonString = await http.read(beersUri);
    var beersJson = jsonDecode(jsonString);
    tableStateNotifier.value = beersJson;
  }

  Future<void> carregarCafes(qtd) async {
    var coffeeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': qtd});

    var jsonString = await http.read(coffeeUri);
    var coffeeJson = jsonDecode(jsonString);
    tableStateNotifier.value = coffeeJson;
  }
}

final dataService = DataService();

var opcao = [5, 10, 15];
var op2 = opcao[0];

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
      body: Column(
        children: [
          MyOpcao(),
          ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(jsonObjects: value, propertyNames: dataService.propertyNames, 
                columnNames: dataService.columnsNames,
                );
              }),
        ],
      ),
      bottomNavigationBar:
          NewNavBar(itemSelectedCallback: dataService.carregar),
    ));
  }
}


class MyOpcao extends HookWidget {
  MyOpcao();

  @override
  Widget build(BuildContext context) {
    var state = useState(opcao[0]);
    return Container(
      height: 105,
      width: double.infinity,
      color: Colors.purple[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Selecione o número de itens que deseja visualizar e click no ícone abaixo:",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(
                      value: opcao[0],
                      groupValue: state.value,
                      onChanged: (genero0) {
                        state.value = opcao[0];
                        op2 = opcao[0];
                      },
                    ),
                    Text(
                      "5 Itens",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: opcao[1],
                      groupValue: state.value,
                      onChanged: (genero0) {
                        state.value = opcao[1];
                        op2 = opcao[1];
                      },
                    ),
                    Text(
                      "10 Itens",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: opcao[2],
                      groupValue: state.value,
                      onChanged: (genero0) {
                        state.value = opcao[2];
                        op2 = opcao[2];
                      },
                    ),
                    Text(
                      "15 Itens",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index, op2.toString());
        },
        currentIndex: state.value,
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
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 535,
      height: MediaQuery.of(context).size.height * 0.70,
      width: double.infinity,
      child: SingleChildScrollView(
        child: DataTable(
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
                .toList()),
      ),
    );
  }
}