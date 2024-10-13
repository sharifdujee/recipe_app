import 'package:flutter/material.dart';
import 'package:receipe_app/components/home_appbar.dart';
import 'package:receipe_app/components/tab_bar_widget.dart';
import 'package:receipe_app/components/text_field_widget.dart';
import 'package:receipe_app/constants/images_path.dart';
import 'package:receipe_app/screen/recipe_category.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppbar(),
            SizedBox(
              height:  h * .022,

            ),
            const TextFieldWidget(),
            SizedBox(
             height:  h * 0.12,
            ),
            Container(
              height:  h * .25,
              width:  w,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImagesPath.explore), fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            SizedBox(
              height:  h * .023,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RecipeCategory()));
                  },
                  child: Text('Categories', style: TextStyle(
                    fontSize: w * .045,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                const Text('See All'),
                SizedBox(
                  height:  h * .022,
                )
              ],
            ),
            SizedBox(
              height:  h * .022,
            ),

            const TabBarWidget()
          ],
        ),
      )),
    );
  }
}
