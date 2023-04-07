import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Cervejas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Nome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataColumn(label: Text("Estilo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataColumn(label: Text("IBU",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("La Fin Du Monde")),
                  DataCell(Text("Bock")),
                  DataCell(Text("65")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Sapporo Premium")),
                  DataCell(Text("Sour Ale")),
                  DataCell(Text("54")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Duvel")),
                  DataCell(Text("Pilsner")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Skol")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("54")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Itaipava")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Devassa")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("La Fin Du Monde")),
                  DataCell(Text("Bock")),
                  DataCell(Text("65")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Sapporo Premium")),
                  DataCell(Text("Sour Ale")),
                  DataCell(Text("54")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Duvel")),
                  DataCell(Text("Pilsner")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Skol")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("54")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Itaipava")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Devassa")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("La Fin Du Monde")),
                  DataCell(Text("Bock")),
                  DataCell(Text("65")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Sapporo Premium")),
                  DataCell(Text("Sour Ale")),
                  DataCell(Text("54")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Duvel")),
                  DataCell(Text("Pilsner")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Skol")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("54")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Itaipava")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("82")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Devassa")),
                  DataCell(Text("Puro Malte")),
                  DataCell(Text("82")),
                ]),
              ],
            ),
          )
        ),
        
        
        
      ),
    );
  }
}
