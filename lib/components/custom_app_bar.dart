import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  const CustomAppBar({super.key, required this.title, required this.back});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.deepOrangeAccent,
      title: Text(title, style:  TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: w * .06,
        letterSpacing: 2, color: Colors.black45,


      ),
      ),
      centerTitle: true,
      leading: back? const BackButton(color: Colors.white,):null,
    );
  }


}
