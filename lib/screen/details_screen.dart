import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipe_app/components/circle_button.dart';
import 'package:receipe_app/components/custom_app_bar.dart';
import 'package:receipe_app/components/custom_cliper_path.dart';
import 'package:receipe_app/components/details_ingredientList.dart';
import 'package:receipe_app/constants/share.dart';
import 'package:receipe_app/constants/show_details_dialog.dart';
import 'package:receipe_app/constants/show_table.dart';
import 'package:receipe_app/constants/start_cooking.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const DetailsScreen({super.key, required this.item});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    String time = widget.item['totalTime'].toString();
    var myBox = Hive.box('saved');
    return Scaffold(
      appBar: const CustomAppBar(title: 'Details', back:false,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: h * .44,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: h * .04,
                    left: w * .05,
                    child: CircleAvatar(
                      child: BackButton(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.item['label'],
                      style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text('$time Minutes'),
                    SizedBox(
                      height: h * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ShareRecipe.share(widget.item['url']);
                            // Add your share functionality here
                          },
                          child: CircleButton(icon: Icons.share, label: 'Share'),
                        ),
                        ValueListenableBuilder(
                          valueListenable:myBox.listenable() ,
                            builder: (context, box, _){
                            String key = widget.item['label'];
                            bool saved = myBox.containsKey(key);
                            if(saved){
                              return GestureDetector(
                                onTap: (){
                                  myBox.delete(key);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                      content: Text('Data is deleted')));
                                },

                                  child: const Icon(Icons.bookmark_border,));
                            }
                            else{
                              return  GestureDetector(
                                onTap: (){
                                  myBox.put(key, key);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    duration: Duration(seconds: 1),
                                      content: Text('Data is Successfully added')));
                                },
                                  child: CircleButton(icon: Icons.bookmark_border, label: 'Bookmark'));
                            }
                            },
                             ),
                        GestureDetector(
                          onTap: (){

                          },
                            child: GestureDetector(
                              onTap: (){
                                ShowDialog.showCalories(widget.item['totalNutrients'], context);
                              },
                                child: CircleButton(icon: Icons.monitor_heart_outlined, label: 'Calories'))),
                        GestureDetector(
                          onTap: (){
                            ShowTable.showTable(context);
                          },
                            child: CircleButton(icon: Icons.table_chart_outlined, label: 'Unit Chart')),
                      ],
                    ),
                    SizedBox(
                      height: h * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Direction',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * .06,
                          ),
                        ),
                        SizedBox(
                          width: w * .34,
                          child: ElevatedButton(
                            onPressed: () {
                              StartCooking.startCooking(widget.item['url']);
                            },
                            child: const Text('Start'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .02,
                    ),
                    Container(
                      height: h * .07,
                      width: w,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                color: Colors.redAccent,
                                child: Center(
                                  child: Text(
                                    'Ingredients Required',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: w * .05,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              child:  Text('${widget.item['ingredientLines'].length} items need'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 1.8,
                      child: DetailsIngredientList(
                        ingridents: widget.item['ingredients'],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
