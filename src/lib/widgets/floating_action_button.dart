import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget{
  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    });

  final Icon icon;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){} ,
      child: icon,
      );
  }
}

