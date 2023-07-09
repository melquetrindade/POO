import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TableStatus{idle,loading,ready,error}

enum ItemType{
  users, appliances, addresses, none;
  String get asString => '$name';

  List<String> get columns => this == users? ["E-mail", "Primeiro Nome", "Aniversário"] :
                              this == appliances? ["Equipamento", "Marca", "UID"]:
                              this == addresses? ["Cidade", "Rua", "Comunidade"]:
                              [] ;
  List<String> get properties => this == users? ["email", "first_name", "date_of_birth"] :
                              this == appliances? ["equipment", "brand", "uid"]:
                              this == addresses? ["city", "street_name", "community"]:
                              [] ;
}

class DataService{
  static const MAX_N_ITEMS = 15;
  static const MIN_N_ITEMS = 3;
  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;
  List _possibleNItems = [MIN_N_ITEMS, DEFAULT_N_ITEMS, MAX_N_ITEMS];

  int get numberOfItems {
    return _numberOfItems;
  }

  set numberOfItems(n){
    _numberOfItems = n < 0 ? MIN_N_ITEMS : n > MAX_N_ITEMS ? MAX_N_ITEMS : n;
  }

  List get possibleNItems {
    return _possibleNItems;
  }

  set possibleNItems(n){
    _possibleNItems = possibleNItems;
  }

  ValueNotifier<Map<String,dynamic>> tableStateNotifier = ValueNotifier({
    'status':TableStatus.idle,
    'dataObjects':[],
    'itemType': ItemType.none
  });
  
  void carregar(index){
    final params = [ItemType.users, ItemType.appliances, ItemType.addresses];
    carregarPorTipo(params[index]);  
  }

  List filtarObjetos() {
    String filtro = tableStateNotifier.value['filterCriteria'];
    List objetos = tableStateNotifier.value['dataObjects'] ?? [];
    if (objetos == []) return [];
    if (filtro == '') return objetos;
    List objetosFiltrados = objetos.where(
      (e) => e.values.map(
        (v) => v.toString().contains(filtro)
      ).toList().contains(true)
    ).toList();

    return objetosFiltrados;
  }

  void sort(final String propriedade, final bool ordem) {
    List objetos = tableStateNotifier.value['dataObjects'] ?? [];
    if (objetos == []) return;
    List a = objetos;
    List b = objetos;
    if (!ordem) {
      objetos.sort((a, b) => a[propriedade].compareTo(b[propriedade]));
    } else {
      objetos.sort((a, b) => a[propriedade].compareTo(b[propriedade]));
      objetos = objetos.reversed.toList();
    }
    emitirEstadoOrdenado(objetos, propriedade, ordem);
  }

  Uri montarUri(ItemType type) {
    return Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/v2/${type.asString}',
        queryParameters: {'size': '$_numberOfItems'});
  }

  Future<List<dynamic>> acessarApi(Uri uri) async{
    var jsonString = await http.read(uri);
    var json = jsonDecode(jsonString);
    json = [...tableStateNotifier.value['dataObjects'], ...json];
    return json;
  }

  void emitirEstadoOrdenado(List objetosOrdenados, String propriedade, bool ascending) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value); 
    estado['dataObjects'] = objetosOrdenados;
    estado['sortCriteria'] = propriedade;
    estado['ascending'] = !ascending;
    tableStateNotifier.value = estado;
  }

  void emitirEstadoFiltrado(String filtro) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);
    estado['filterCriteria'] = filtro;
    tableStateNotifier.value = estado;
  }

  void emitirEstadoCarregando(ItemType type){
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'itemType': type,
      'filterCriteria': ''
    };
  }

  void emitirEstadoPronto(ItemType type, var json){
    tableStateNotifier.value = {
      'itemType': type,
      'status': TableStatus.ready,
      'dataObjects': json,
      'propertyNames': type.properties,
      'columnNames': type.columns,
      'filterCriteria': ''
    };
  }

  bool temRequisicaoEmCurso() => tableStateNotifier.value['status'] == TableStatus.loading;
  bool mudouTipoDeItemRequisitado(ItemType type) => tableStateNotifier.value['itemType'] != type;

  void carregarPorTipo(ItemType type) async{
    //ignorar solicitação se uma requisição já estiver em curso
    if (temRequisicaoEmCurso()) return;
    if (mudouTipoDeItemRequisitado(type)){
      emitirEstadoCarregando(type);
    }
    var uri = montarUri(type);
    var json = await acessarApi(uri);
    emitirEstadoPronto(type, json);
  }
}

final dataService = DataService();