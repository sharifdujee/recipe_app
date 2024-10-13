import 'package:flutter/material.dart';
import 'package:receipe_app/constants/category_list.dart';
import 'package:receipe_app/screen/all_recipe.dart';
import 'package:receipe_app/screen/recipe_category_view.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * .06,
              ),
              Text(
                'For You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: w * .06,
                ),
              ),
              SizedBox(
                height: h * .106,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeCategoryView(name: name[0], image: images[0]),
                    RecipeCategoryView(name: name[1], image: images[1]),
                    RecipeCategoryView(name: name[2], image: images[2]),
                    RecipeCategoryView(name: name[3], image: images[3]),
                  ],
                ),
              ),
              SizedBox(
                height: h * .01,
              ),
              Text(
                'For You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: w * .055,
                ),
              ),
              // GridView with spacing added
              SizedBox(
                height: h * .45, // Adjust height if necessary
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(), // Disable scroll in GridView
                  shrinkWrap: true,
                  itemCount: categoryImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: w * .03, // Horizontal spacing between items
                    mainAxisSpacing: h * .01,  // Vertical spacing between items
                    mainAxisExtent: w * .21,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  AllRecipe(recipe: categories[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: h * .043,
                                width: w * .08,
                                child: Image(
                                  image: AssetImage(categoryImages[index]),
                                ),
                              ),
                              SizedBox(
                                height: h * .003,
                              ),
                              Text(
                                categories[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: h * .02,
              ),
              Text('Your Preferences', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .055

              ),),
              SizedBox(
                height: h * .13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeCategoryView(name: 'Easy', image: images[0]),
                    RecipeCategoryView(name: 'Quick', image: images[1]),
                    RecipeCategoryView(name: 'Beef', image: images[2]),
                    RecipeCategoryView(name: 'Low Fat', image: images[3]),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
