import 'package:flutter/material.dart';

enum Genero { Masculino, Feminino, Outro }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Formulário"),
          ),
        ),
        body: NewBody(),
      ),
    );
  }
}

class NewBody extends StatefulWidget {
  NewBody({Key? key}) : super(key: key);

  @override
  _NewBodyState createState() => _NewBodyState();
}

class _NewBodyState extends State<NewBody> {
  Genero genero = Genero.Masculino;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text("Formulário tipo Texto:")),
                Container(height: 15),
                TextField(
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder())),
                Container(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder()),
                )
              ]),
        ),
        Container(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
            Text("Formulário tipo Radio:"),
            Container(height: 10,),
            Row(
              children: [
                Radio(
                  value: Genero.Masculino,
                  groupValue: genero,
                  onChanged: (genero0) {
                    setState(() {
                      genero = Genero.Masculino;
                    });
                  },
                ),
                Text("Masculino"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: Genero.Feminino,
                  groupValue: genero,
                  onChanged: (genero1) {
                    setState(() {
                      genero = Genero.Feminino;
                    });
                  },
                ),
                Text("Feminino"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: Genero.Outro,
                  groupValue: genero,
                  onChanged: (select) {
                    setState(() {
                      genero = Genero.Outro;
                    });
                  },
                ),
                Text("Outro"),
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
