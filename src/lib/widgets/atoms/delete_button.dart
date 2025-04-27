import 'package:flutter/material.dart';
import '../../custom_styles.dart';

// Delete Button is used in widgets and views where existing entries are deleted

class DeleteButton extends StatelessWidget {

  final VoidCallback? onDelete;
  final String buttonDeleteText;

  const DeleteButton({
      super.key,
      required this.onDelete,
      required this.buttonDeleteText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Style.widthButtonXS,
      child: ElevatedButton(
      onPressed: onDelete,
      style: Style.secondaryButtonStyle,
      child: Text(buttonDeleteText, style: TextStyle(color: Style.fontColorDark, fontWeight: FontWeight.bold),),
      ),
    ); 
  }
}
