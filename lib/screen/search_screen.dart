import 'package:flutter/material.dart';
import 'package:receipe_app/components/custom_app_bar.dart';
import 'package:receipe_app/components/text_field_widget.dart';
import 'package:receipe_app/constants/search_tags.dart';
import 'package:receipe_app/screen/all_recipe.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Search', back: true),
      body: Padding(padding: EdgeInsets.symmetric(vertical: h * .016, horizontal: w * .032),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFieldWidget(


          ),
          SizedBox(
            height: h * .04,
          ),
          Text('Search Tags', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: w * .06
          ),),
          Wrap(
            spacing: 8,
            children:
              tags.map((label){
                return ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllRecipe(recipe: label)));
                }, child: Text(label));
              }).toList()

          )

        ],
      ),),

    );
  }
}
