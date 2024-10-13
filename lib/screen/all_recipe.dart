import 'package:flutter/material.dart';
import 'package:receipe_app/components/custom_app_bar.dart';
import 'package:receipe_app/constants/constants_function.dart';
import 'package:receipe_app/screen/details_screen.dart';

class AllRecipe extends StatelessWidget {
  final String recipe;
  const AllRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  CustomAppBar(
        title: recipe,
        back: true,
      ),
      body: FutureBuilder(
          future: ConstantFunction.getResponse(recipe),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Data'),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Ensure that we only build as many items as there are in the data
            return Padding(
              padding: EdgeInsets.only(
                right: w * .034,
                left: w * .034,
                top: h * .03,
              ),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 10,
                      childAspectRatio: .6 / 1),
                  itemCount: snapshot.data!.length,  // Add this line
                  itemBuilder: (context, index) {
                    Map<String, dynamic> snap = snapshot.data![index];
                    int time = snap['totalTime'].toInt();
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(item: snap)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(snap['image']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Positioned(
                                    top: 7,
                                      left: 15,
                                      child: Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            '${time.toString()} Minutes',
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ))
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6, right: 8),
                                child: Text(
                                  snap['label'],
                                  style: TextStyle(
                                      fontSize: w * .03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
