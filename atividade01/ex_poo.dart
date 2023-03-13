// Aluno: Melque Rodrigues da Trindade Santos

class Venda {
  String data;
  List<Item> itens = [];
  double total() => itens.fold(0, (sum, e) => sum + e.total());

  Venda({required this.data, required this.itens});
}

class Produto {
  double preco;
  String descrisao;
  String dataValidade;

  Produto({required this.preco, required this.descrisao, required this.dataValidade});
}

class Item {
  Produto produto;
  int qtd;
  double total() => this.qtd * produto.preco;

  Item({required this.produto, required this.qtd});
}

void main() {
  Produto ptd01 = Produto(preco: 4.5, descrisao: "leite", dataValidade: "20/03/2023");
  Item item01 = Item(produto: ptd01, qtd: 5);

  Produto ptd02 = Produto(preco: 1.35, descrisao: "pilha", dataValidade: "22/03/2023");
  Item item02 = Item(produto: ptd02, qtd: 4);

  Produto ptd03 = Produto(preco: 8, descrisao: "arroz", dataValidade: "21/03/2023");
  Item item03 = Item(produto: ptd03, qtd: 2);

  Venda carrinho = Venda(data: "13/03/2023", itens: [item01, item02, item03]);
  print(carrinho.total());
}