import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

enum ItemType { beer, coffee, nation, none }

class DataService {
  static const MAX_N_ITEMS = 15;
  static const MIN_N_ITEMS = 3;
  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;

  set numberOfItems(n) {
    _numberOfItems = n <= 0
        ? MIN_N_ITEMS
        : n > MAX_N_ITEMS
            ? MAX_N_ITEMS
            : n;
  }

  get numberOfItems {
    return _numberOfItems;
  }

  ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  String elPath = '';
  var tipo = ItemType.coffee;

  void carregar(index) {
    if (index == 0) {
      elPath = 'api/coffee/random_coffee';
      tipo = ItemType.coffee;
    } else if (index == 1) {
      elPath = 'api/beer/random_beer';
      tipo = ItemType.beer;
    } else {
      elPath = 'api/nation/random_nation';
      tipo = ItemType.nation;
    }

    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes];

    funcoes[index]();
  }

  dynamic carregaUri() {
    if (tableStateNotifier.value['status'] == TableStatus.loading) return;

    if (tableStateNotifier.value['itemType'] != tipo) {
      tableStateNotifier.value = {
        'status': TableStatus.loading,
        'dataObjects': [],
        'itemType': tipo
      };
    }

    var objsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: elPath,
        queryParameters: {'size': '$_numberOfItems'});
    return objsUri;
  }

  void carregarCafes() {
    var receb = carregaUri();

    http.read(receb).then((jsonString) {
      var coffeesJson = jsonDecode(jsonString);

      //se já houver cafés no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading)
        coffeesJson = [
          ...tableStateNotifier.value['dataObjects'],
          ...coffeesJson
        ];

      tableStateNotifier.value = {
        'itemType': ItemType.coffee,
        'status': TableStatus.ready,
        'dataObjects': coffeesJson,
        'propertyNames': ["blend_name", "origin", "variety"],
        'columnNames': ["Nome", "Origem", "Tipo"]
      };
    });
  }

  void carregarNacoes() {
    var receb = carregaUri();

    http.read(receb).then((jsonString) {
      var nationsJson = jsonDecode(jsonString);

      //se já houver nações no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading)
        nationsJson = [
          ...tableStateNotifier.value['dataObjects'],
          ...nationsJson
        ];

      tableStateNotifier.value = {
        'itemType': ItemType.nation,
        'status': TableStatus.ready,
        'dataObjects': nationsJson,
        'propertyNames': [
          "nationality",
          "capital",
          "language",
          "national_sport"
        ],
        'columnNames': ["Nome", "Capital", "Idioma", "Esporte"]
      };
    });
  }

  void carregarCervejas() {
    var receb = carregaUri();

    http.read(receb).then((jsonString) {
      var beersJson = jsonDecode(jsonString);

      //se já houver cervejas no estado da tabela...

      if (tableStateNotifier.value['status'] != TableStatus.loading)
        beersJson = [...tableStateNotifier.value['dataObjects'], ...beersJson];

      tableStateNotifier.value = {
        'itemType': ItemType.beer,
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["name", "style", "ibu"],
        'columnNames': ["Nome", "Estilo", "IBU"]
      };
    });
  }
}

final dataService = DataService();
