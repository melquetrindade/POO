import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class DataService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier =
      ValueNotifier({'status': TableStatus.idle, 'dataObjects': []});

  void carregar(index) {
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes, carregarUsers];
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': []
    };
    funcoes[index]();
  }

  void carregarCafes() {
    var coffeeUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});

    http.read(coffeeUri).then((jsonString) {
      var coffeeJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': coffeeJson,
        'propertyNames': ["blend_name", "origin", "variety"],
        'columnNames': ["Nome", "Origem", "Variedade"]
      };
    });
  }

  void carregarNacoes() async {
    var nacoesUri = Uri(
        scheme: 'http',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(nacoesUri);
    var nacoesJson = jsonDecode(jsonString);
    tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': nacoesJson,
        'propertyNames': ["nationality", "capital", "national_sport"],
        'columnNames': ["Nacionalidade", "Capital", "Esporte Nacional"]
    };
  }

  void carregarCervejas() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '5'});

    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["name", "style", "ibu"],
        'columnNames': ["Nome", "Estilo", "IBU"]
      };
    });
  }

  void carregarUsers() async {
    var usersUri = Uri(
        scheme: 'http',
        host: 'random-data-api.com',
        path: 'api/v2/users',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(usersUri);
    var usersJson = jsonDecode(jsonString);
    tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': usersJson,
        'propertyNames': ["first_name", "email", "password"],
        'columnNames': ["Nome", "E-mail", "Senha"]
    };
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
                switch (value['status']) {
                  case TableStatus.idle:
                    return MyMessage();
                  case TableStatus.loading:
                    return Center(child: CircularProgressIndicator());
                  case TableStatus.ready:
                    return DataTableWidget(
                        jsonObjects: value['dataObjects'],
                        propertyNames: value['propertyNames'],
                        columnNames: value['columnNames']);
                  case TableStatus.error:
                    return Text("Lascou");
                }
                return Text("...");
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class MyMessage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.24,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          color: Colors.purple[800],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Selecione um Botão",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Para usar o App basta selecionar o item que deseja visualizar",
                style: TextStyle(
                  
                  color: Colors.white
                ),
              ),
            )
          ]
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
    var state = useState(0);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",icon: Icon(Icons.coffee_outlined)),
          BottomNavigationBarItem(
            label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
            label: "Nações", icon: Icon(Icons.flag_outlined)),
          BottomNavigationBarItem(
            label: "Usuários", icon: Icon(Icons.people)),
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
