import 'package:flutter/material.dart';
import 'package:receipe_app/components/ingrident_item.dart';
class DetailsIngredientList extends StatelessWidget {
  final List<dynamic> ingridents;
  const DetailsIngredientList({super.key, required this.ingridents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingridents.length,
      physics: const ScrollPhysics(
        parent: NeverScrollableScrollPhysics()
      ),
        itemBuilder: (context, index){
        int quantity = ingridents[index]['quantity'].toInt();
        return  IngridentItem(
          text: ingridents[index]['foodCategory']??'',
          quantity: quantity.toString(),
          imageUrl: ingridents[index]['image']??'',
          measure: ingridents[index]['measure']??'',
          food: ingridents[index]['food']??'',
        );

    });
  }
}
