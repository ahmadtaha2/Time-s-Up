import 'package:flutter/material.dart';

class SearchEngine extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    /* TODO: 
    this will show the result of the search,
    and a\in our case this will take me to another
    scareen which is the choosen app / website
    */
    return Center(
      child: Text(query),
    );
  }

  /**
   * TODO:
   * create a list that stores the search suggestions the filter them
   * 
   * I've create an example below
   */

  /// this list stores the needed input for the search engine
  List apps = [
    'Solo Learn',
    'WhatsApp',
    'Spotify',
    'Netflix',
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    /// this is the input filter
    List filteredInput = apps
        .where(
          (element) => element.toString().toLowerCase().contains(query),
        )
        .toList();
    // TODO: this will the show filtered search suggestions
    return ListView.builder(
      itemCount: query == '' ? apps.length : filteredInput.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              query == '' ? '${apps[index]}' : '${filteredInput[index]}',
            ),
            onTap: () {
              query = query == '' ? apps[index] : filteredInput[index];
              showResults(context);
            },
          ),
        );
      },
    );
  }
}
