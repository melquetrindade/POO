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
  List<bool> checkBooks = [false, false, false, false, false];
  double _curretRange = 20;

  void mostrarSnackBar() {
    final snackBar = SnackBar(
      content: Text("Formulário enviado com sucesso!"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
            child: Column(children: [
              Text("Formulário tipo Radio:"),
              Container(
                height: 10,
              ),
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
          Container(
            height: 30,
          ),
          Container(
            child: Column(children: [
              Text("Formulário tipo CheckBox:"),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[0],
                    onChanged: (check) {
                      setState(() {
                        //print(check);
                        checkBooks[0] = !checkBooks[0];
                      });
                    },
                  ),
                  Text("Corte de Espinhos e Rosas")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[1],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[1] = !checkBooks[1];
                      });
                    },
                  ),
                  Text("De Sangue e Cinzas")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[2],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[2] = !checkBooks[2];
                      });
                    },
                  ),
                  Text("Amores Verdadeiros")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[3],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[3] = !checkBooks[3];
                      });
                    },
                  ),
                  Text("Novembro 9")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBooks[4],
                    onChanged: (check) {
                      setState(() {
                        checkBooks[4] = !checkBooks[4];
                      });
                    },
                  ),
                  Text("A Queda dos Reinos")
                ],
              ),
            ]),
          ),
          Container(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text("Formulário tipo Slider:"),
                  ),
                  Row(
                    children: [
                      const Text("Min"),
                      Slider(
                          value: _curretRange,
                          max: 100,
                          min: 0,
                          divisions: 10,
                          onChanged: (double valor) {
                            setState(() {
                              _curretRange = valor;
                            });
                          }),
                      const Text("Max"),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text("Valor: " + "$_curretRange"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => mostrarSnackBar(),
              child: Column(
                children: [
                  Text("Enviar Formulário"),
                ],
              ))
        ]),
      ),
    );
  }
}