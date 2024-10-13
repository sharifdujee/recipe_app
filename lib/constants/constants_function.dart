import 'dart:convert';

import 'package:http/http.dart' as http;

class ConstantFunction {
  static Future<List<Map<String, dynamic>>> getResponse(
      String findRecipe) async {
    String id = 'e4b666b9';
    String key = '96ecb2b0ce98b2330564f667cfeabd6e';

    String api =
        "https://api.edamam.com/search?q=$findRecipe&app_id=$id&app_key=$key&from=0&to=3&calories=591-722&health=alcohol-free";
    try {
      var response = await http.get(Uri.parse(api));
      List<Map<String, dynamic>> recipe = [];
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        var data = jsonDecode(response.body);
        if (data['hits'] != null) {
          for (var hit in data['hits']) {
            recipe.add(hit['recipe']);
          }
        }
       // print('The recipe is $recipe');
        return recipe;
      }
      print('the whole recipe is $recipe');
      return recipe;
    } catch (e) {}
    throw Exception('Unable to fetch the data');
  }
}
