import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  String get searchFieldLabel => "nome do pokemon";
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    /*
    List nexEvolution = [];
    pokemon = dataService.tableStateNotifier.value['dataObjects'];
    List matchQuery = [];
    for (var poke in pokemon) {
      if (poke['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(poke);
      }
    }*/

    return GestureDetector(
      onTap: () {},
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /*
    dataService.carregarPokemon();
    pokemon = dataService.tableStateNotifier.value['dataObjects'];
    List matchQuery = [];
    for (var poke in pokemon) {
      if (poke['name'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(poke);
      }
    }*/

    return GestureDetector(onTap: () {});
  }
}
