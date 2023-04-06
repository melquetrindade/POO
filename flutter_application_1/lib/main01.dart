import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue, ),
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Meu Portfólio",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                     ),
      ),
      backgroundColor: Colors.blue.shade900,
    ),
    body: Center(
      child: Column(
        children: [
          const Text("\nProjetos\n\n",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
          Text("Calculadora IMC\n",
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          Text("Clone Ifood",
                style: TextStyle(
                  color: Colors.lime,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
        ]
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      
      
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (op) {
   
        var buttonSelect = Teste(a: op);
        buttonSelect.mostra();
        
        
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Perfil",
          icon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
          label: "Pesquisar",
          icon: Icon(Icons.search),
        )
      ]
    ),
   ));
  
  runApp(app);
}

class Teste{
  int a;
  
  void mostra(){
    if(a == 0){
      print("Botão: Home"); 
    }
    else if(a == 1){
      print("Botão: Perfil");
    }
    else{
      print("Botão: Pesquisa");
    }
  }
  
  Teste({required this.a});
}