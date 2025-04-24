import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget{
  const CustomElevatedButton({
    super.key,
    required this.onSubmit,
    required this.content,
    });

  final Widget content;
  final VoidCallback? onSubmit;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onSubmit,
      child: content,
      );
  }
}

