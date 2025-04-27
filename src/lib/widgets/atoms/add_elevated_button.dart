import 'package:flutter/material.dart';
import '../../custom_styles.dart';

class CustomElevatedButton extends StatelessWidget {
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
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Style.colorPrimaryAction, // Background color (use Style)
      ),
      onPressed: onSubmit,
      child: content,
    );
  }
}
