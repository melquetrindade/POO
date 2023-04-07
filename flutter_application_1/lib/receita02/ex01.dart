import 'package:flutter/material.dart';

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

class NewExpanded extends StatelessWidget{
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

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Dicas"),
      ),
      body: NewExpanded(),
      bottomNavigationBar: NewNavBar(),
    ),
  );

  runApp(app);
}
