import 'package:flutter/material.dart';

var dataObjects = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("no build da classe $MyApp");
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: DataTableWidget(jsonObjects: dataObjects),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatefulWidget {
  NewNavBar({Key? key}) : super(key: key);

  @override
  _NewNavBarState createState() => _NewNavBarState();
}

class _NewNavBarState extends State<NewNavBar> {
  int state = 0;

  @override
  Widget build(BuildContext context) {
    print("no build da classe $_NewNavBarState");
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            state = index;
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
  DataTableWidget({this.jsonObjects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["name", "style", "ibu"];
    print("no build da classe $DataTableWidget");
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
