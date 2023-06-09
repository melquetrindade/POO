class Ordenador {
  List ordenarCervejasPorNomeCrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];
        if (atual["name"].compareTo(proximo["name"]) > 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cervejasOrdenadas;
  }

  List ordenarCervejasPorNomeDecrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];
        if (atual["name"].compareTo(proximo["name"]) < 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cervejasOrdenadas;
  }

  List ordenarCervejasPorEstiloCrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];
        if (atual["style"].compareTo(proximo["style"]) > 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cervejasOrdenadas;
  }

  List ordenarCervejasPorEstiloDecrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];
        if (atual["style"].compareTo(proximo["style"]) < 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cervejasOrdenadas;
  }

  List ordenarCervejasPorIbuCrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];
        if (atual["ibu"].compareTo(proximo["ibu"]) > 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cervejasOrdenadas;
  }

  List ordenarCervejasPorIbuDecrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];
        var proximo = cervejasOrdenadas[i + 1];
        if (atual["ibu"].compareTo(proximo["ibu"]) < 0) {
          var aux = cervejasOrdenadas[i];
          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];
          cervejasOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cervejasOrdenadas;
  }

  List ordenarCafesPorNomeCrescente(List cafes) {
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cafesOrdenados.length - 1; i++) {
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i + 1];
        if (atual["blend_name"].compareTo(proximo["blend_name"]) > 0) {
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i + 1];
          cafesOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cafesOrdenados;
  }

  List ordenarCafesPorNomeDecrescente(List cafes) {
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cafesOrdenados.length - 1; i++) {
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i + 1];
        if (atual["blend_name"].compareTo(proximo["blend_name"]) < 0) {
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i + 1];
          cafesOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cafesOrdenados;
  }

  List ordenarCafesPorOrigemCrescente(List cafes) {
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cafesOrdenados.length - 1; i++) {
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i + 1];
        if (atual["origin"].compareTo(proximo["origin"]) > 0) {
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i + 1];
          cafesOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cafesOrdenados;
  }

  List ordenarCafesPorOrigemDecrescente(List cafes) {
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cafesOrdenados.length - 1; i++) {
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i + 1];
        if (atual["origin"].compareTo(proximo["origin"]) < 0) {
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i + 1];
          cafesOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cafesOrdenados;
  }

  List ordenarCafesPorVariedadeCrescente(List cafes) {
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cafesOrdenados.length - 1; i++) {
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i + 1];
        if (atual["variety"].compareTo(proximo["variety"]) > 0) {
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i + 1];
          cafesOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cafesOrdenados;
  }

  List ordenarCafesPorVariedadeDecrescente(List cafes) {
    List cafesOrdenados = List.of(cafes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < cafesOrdenados.length - 1; i++) {
        var atual = cafesOrdenados[i];
        var proximo = cafesOrdenados[i + 1];
        if (atual["variety"].compareTo(proximo["variety"]) < 0) {
          var aux = cafesOrdenados[i];
          cafesOrdenados[i] = cafesOrdenados[i + 1];
          cafesOrdenados[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return cafesOrdenados;
  }

  List ordenarNacoesPorNomeCrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["nationality"].compareTo(proximo["nationality"]) > 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorNomeDecrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["nationality"].compareTo(proximo["nationality"]) < 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorCapitalCrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["capital"].compareTo(proximo["capital"]) > 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorCapitalDecrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["capital"].compareTo(proximo["capital"]) < 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorLinguaCrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["language"].compareTo(proximo["language"]) > 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorLinguaDecrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["language"].compareTo(proximo["language"]) < 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorEsporteCrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["national_sport"].compareTo(proximo["national_sport"]) > 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarNacoesPorEsporteDecrescente(List nacoes) {
    List nacoesOrdenadas = List.of(nacoes);
    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;
      for (int i = 0; i < nacoesOrdenadas.length - 1; i++) {
        var atual = nacoesOrdenadas[i];
        var proximo = nacoesOrdenadas[i + 1];
        if (atual["national_sport"].compareTo(proximo["national_sport"]) < 0) {
          var aux = nacoesOrdenadas[i];
          nacoesOrdenadas[i] = nacoesOrdenadas[i + 1];
          nacoesOrdenadas[i + 1] = aux;
          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);
    return nacoesOrdenadas;
  }

  List ordenarFuderoso(List objetos, Decididor decididor){

    List objetosOrdenados = List.of(objetos);
    bool trocouAoMenosUm;

    do{
      trocouAoMenosUm = false;
      for (int i=0; i<objetosOrdenados.length-1; i++){
        var atual = objetosOrdenados[i];
        var proximo = objetosOrdenados[i+1];
        if ( decididor.precisaTrocarAtualPeloProximo(atual,proximo)){
          var aux = objetosOrdenados[i];
          objetosOrdenados[i] = objetosOrdenados[i+1];
          objetosOrdenados[i+1] = aux;
          trocouAoMenosUm = true;
        }
      }
    }while(trocouAoMenosUm);
    return objetosOrdenados;

  }
}

abstract class Decididor{
  bool precisaTrocarAtualPeloProximo(dynamic atual, dynamic proximo);
}
