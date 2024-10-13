import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipe_app/components/custom_app_bar.dart';
import 'package:receipe_app/constants/share.dart';
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myBox = Hive.box('saved');
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Saved', back: false),
      body: Padding(padding: EdgeInsets.only(top: 10, right: 8, left: 8),
        child: ValueListenableBuilder(valueListenable: myBox.listenable(),
            builder: (context, box, _){
          var data = box.values.toList();

         return ListView.builder(
           itemCount: box.length,
           itemBuilder: (context, index){
             return  ListTile(
               title: Container(
                 height: h * .085,
                 color: Colors.grey[100],
                 child: Row(
                   children: [
                     Expanded(
                         flex: 3,
                         child:Text(data[index]) ),
                     PopupMenuButton(itemBuilder: (context){
                       return [
                         PopupMenuItem(child: Text('Share'), value: 'share',),
                         PopupMenuItem(child: Text('Delete'), value: 'delete',)

                       ];
                     },
                       onSelected: (String value) async{
                         if(value=='delete'){
                           deleteItem(index);
                         }
                         else if(value=='share'){
                           ShareRecipe.share(data[index]);
                         }
                       },
                     ),

                   ],


                 ),

               ),
             );
          },

         );

        }),
      ),
    );
  }
  Future<void> deleteItem(int index)async{
    var myBox = Hive.box('saved');
    await myBox.deleteAt(index);

  }
}
