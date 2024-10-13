import 'package:flutter/material.dart';
import 'package:receipe_app/components/bottom_nav_bar.dart';
import 'package:receipe_app/screen/home_screen.dart';
import 'package:receipe_app/screen/recipe_category.dart';
import 'package:receipe_app/screen/saved_screen.dart';
import 'package:receipe_app/screen/search_screen.dart';
import 'package:receipe_app/screen/shopping_screen.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedItem: currentIndex, onTap: (index){
        pageController.animateToPage(index, duration:const  Duration(
          milliseconds: 200
        ), curve: Curves.easeInOut);
        setState(() {
          currentIndex = index;
        });

      },

      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          RecipeCategory(),
          SearchScreen(),
          SavedScreen(),
          ShoppingScreen()

        ],
      ),


    );
  }
}
