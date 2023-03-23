import 'dart:io';

class serieFibonacci {
  int anterior;
  int atual;

  serieFibonacci({
    this.anterior = 0,
    this.atual = 1,
  });

  void numProx() {
    int proximo = anterior + atual;
    print("Numéro da série: $proximo");
    anterior = atual;
    atual = proximo;
  }
}

void main() {
  serieFibonacci num = serieFibonacci();
  bool chave = true;
  while (chave == true) {
    num.numProx();

    print("deseja continar? digite 0-(não) ou 1-(sim)");
    String? op = stdin.readLineSync();

    if (op != null) {
      int opInt = int.parse(op);

      if (opInt == 0) {
        chave = false;
      }else if (opInt == 1) {
        chave = true;
      }
      else{
        print("erro, opção inválida!");
        chave = false;
      }
    } else {
      print("não foi possível proceguir com o sistema!");
      chave = false;
    }
  }
  print("encerrando o sistema!");
}
