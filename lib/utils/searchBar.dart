import 'package:flutter/material.dart';
import 'package:hawker_buddy/pages/food/Food_details.dart';

class SearchBar extends SearchDelegate {
  List<String> searchResults = [
    'Mala',
    'Chicken Rice',
    'Hotpot',
    'Nasi lemak' ,
    'Briyani' ,
  ];

  @override
  List<Widget>? buildActions(BuildContext context)  => [IconButton(onPressed: () {
    if(query.isEmpty){
      close(context,null);
    } else {
      query = '';
    } }, icon: Icon(Icons.clear))];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: () {
   //close search bar
    close(context, null);
  }, icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => FoodDetails(foodID:0, pageId:0,);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResults){
      final result = searchResults.toLowerCase();
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
        },);
  }

}