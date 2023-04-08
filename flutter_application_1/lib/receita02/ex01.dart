import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void bottomSelect(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: bottomSelect, items: const [
      BottomNavigationBarItem(
          label: "Cafés", icon: Icon(Icons.coffee_outlined)),
      BottomNavigationBarItem(
        label: "Cervejas",
        icon: Icon(Icons.local_drink_outlined),
      ),
      BottomNavigationBarItem(
        label: "Nações",
        icon: Icon(Icons.flag_outlined),
      )
    ]);
  }
}

class NewExpanded extends StatelessWidget {
  NewExpanded();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text("La Fin Du Monde - Bock - 65 ibu"),
        ),
        Expanded(
          child: Text("Sapporo Premiume - Sour Ale - 54 ibu"),
        ),
        Expanded(
          child: Text("Duvel - Pilsner - 82 ibu"),
        ),
      ],
    );
  }
}

class NewAppBar extends StatelessWidget {
  NewAppBar();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Dicas"),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: NewAppBar(),
        ),
        body: NewExpanded(),
        bottomNavigationBar: NewNavBar(),
      ),
    );
  }
}
