
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ShowDialog{
  static Future showCalories(Map<String, dynamic> item, BuildContext context) async{
    int fat = item['FAT']['quantity'].toInt();
    int sfat = item['FASAT']['quantity'].toInt();
    int cholesterol = item['CHOLE']['quantity'].toInt();
    int na = item['NA']['quantity'].toInt();
    int carbohydrate = item['CHOCDF.net']['quantity'].toInt();
    int sugar = item['SUGAR']['quantity'].toInt();
    int protein = item['PROCNT']['quantity'].toInt();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),

        ),
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Padding(padding: EdgeInsets.only(bottom: 10),
          child: Text('Nutritional Fact', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),),),
        ),
        content: Container(
          height: 300,

          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
          ),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total Fat'),
                  Text(fat.toString()),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total SFat'),
                  Text(sfat.toString()),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total Cholesterol'),
                  Text(cholesterol.toString()),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total Sodium'),
                  Text(na.toString()),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total CarbonHydrate'),
                  Text(carbohydrate.toString()),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total Sugar'),
                  Text(sugar.toString()),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Total Protein'),
                  Text(protein.toString()),



                ],
              ),


            ],
          ),),
        ),

      );

    });
  }
}