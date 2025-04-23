import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget{
  const CustomElevatedButton({
    super.key,
    required this.icon,
    });

  final Icon icon;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.toNamed("/create"),
      child: icon,
      );
  }
}

