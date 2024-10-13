import 'package:flutter/material.dart';
class CircleButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const CircleButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final w =  MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: w * .06,
          child: Center(
            child: Icon(icon, color: Colors.white,),
          ),
        ),
        SizedBox(
          height:  h * .005,
        ),
        Text(label)

      ],
    );
  }
}
