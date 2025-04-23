import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/widgets/create_screen.dart';

class CustomFloatingActionButton extends StatelessWidget{
  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    });

  final Icon icon;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed("/create"),
      child: icon,
      );
  }
}

