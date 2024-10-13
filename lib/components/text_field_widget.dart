import 'package:flutter/material.dart';
import 'package:receipe_app/screen/all_recipe.dart';
class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
     TextEditingController searchController = TextEditingController();
    return Container(
      height:  h * .06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 323
          ),

        ]
      ),
      child: TextField(
        controller: searchController,
        style: TextStyle(
          fontSize: w * .04,
          color: Colors.black
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "What's cooking in your mind ...",
          hintStyle: TextStyle(
            color: Colors.grey, fontSize: w * .03
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AllRecipe(recipe: searchController.text)));
            },
              child: Icon(Icons.search,color: Colors.deepOrangeAccent,size: w * .07,))
        ),
      ),


    );
  }
}
