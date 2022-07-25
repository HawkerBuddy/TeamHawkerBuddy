import 'package:flutter/material.dart';
import 'package:hawker_buddy/pages/food/Food_details_page.dart';

import 'data_controller.dart';

class SearchBar extends SearchDelegate {
  static List<String> foodName = converter(DataController.PGPFoodName);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
                showSuggestions(context);
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildResults(BuildContext context) {
    List<int> data = indexs(foodName, DataController.PGPFoodName, query);

    return FoodDetails(
      pageId: data[0],
      foodID: data[1],
      count: 0,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = foodName.where((data) {
      final result = data.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  static List<String> converter(List<List<String>> data) {
    data.removeWhere((item) => ["", null].contains(item));

    for (int x = 0; x < data.length; x++) {
      data[x].removeWhere((item) => ["", null].contains(item));
    }
    List<String> save = [];
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        save.add(data[i][j]);
      }
    }
    return save;
  }

  static List<int> indexs(
      List<String> data, List<List<String>> unfiltered, String query) {
    int counter = 0;
    int i = data.indexOf(query);
    int control = unfiltered.length;
    List<int> save = [];
    while (control > 0) {
      control--;
      i = i - unfiltered[counter].length;
      if (i == 0) {
        counter++;
        return save = [counter, i];
      } else if (i < 0) {
        i = i + unfiltered[counter].length;
        return save = [counter, i];
      } else {
        counter++;
      }
    }
    return save;
  }
}
