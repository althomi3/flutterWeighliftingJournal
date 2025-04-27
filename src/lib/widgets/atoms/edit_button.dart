import 'package:flutter/material.dart';
import '../../custom_styles.dart';

// Edit Button is used in widgets and views where existing entries are edited

class EditButton extends StatelessWidget {
  final VoidCallback? onEdit;
  final String buttonEditText;

  const EditButton({required this.onEdit, required this.buttonEditText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Style.widthButtonXS,
      child: ElevatedButton(
        onPressed: onEdit,
        style: Style.secondaryButtonStyle,
        child: Text(
          buttonEditText,
          style: TextStyle(
            color: Style.fontColorDark,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
