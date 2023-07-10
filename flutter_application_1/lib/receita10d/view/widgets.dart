import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../data/data_service.dart';

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var popUpState = useState(dataService.numberOfItems);
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text("Dicas"), actions: [
            PopupMenuButton(
              initialValue: popUpState.value,
              itemBuilder: (_) => dataService.possibleNItems
                  .map((num) => PopupMenuItem(
                        value: num,
                        child: Text("Carregar $num itens por vez"),
                      ))
                  .toList(),
              onSelected: (number) {
                dataService.numberOfItems = number;
                popUpState.value = dataService.numberOfItems;
              },
            )
          ]),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                switch (value['status']) {
                  case TableStatus.idle:
                    return Center(child: Text("Toque em algum botão"));
                  case TableStatus.loading:
                    return Center(child: CircularProgressIndicator());
                  case TableStatus.ready:
                    return InteractiveViewer(
                        constrained: false,
                        child: DataTableWidget(
                          jsonObjects: value['dataObjects'],
                          propertyNames: value['propertyNames'],
                          columnNames: value['columnNames'],
                          isAscending: value['ascending'] ?? false,
                          sortedColumn: value['sortedColumn'] ?? null,
                        ));
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
          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Usuários",
            icon: Icon(Icons.people_outline),
          ),
          BottomNavigationBarItem(
              label: "Eletrodomésticos", icon: Icon(Icons.tv)),
          BottomNavigationBarItem(
              label: "Endereços", icon: Icon(Icons.location_on))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;
  final sortedColumn;
  final isAscending;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const [],
      this.propertyNames = const [],
      this.sortedColumn = null,
      this.isAscending = false});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortedColumn,
        columns: columnNames
            .map((name) => DataColumn(
                onSort: (columnIndex, ascending) =>
                    dataService.ordenarEstadoAtual(
                        propertyNames[columnIndex], isAscending),
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
