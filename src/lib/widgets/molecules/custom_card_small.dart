import 'package:flutter/material.dart';
import '../atoms/edit_button.dart';
import '../atoms/delete_button.dart';
import '../../custom_styles.dart';

class CardSmall extends StatelessWidget {
  final Widget title;
  final Widget paramLiftingset;
  final Widget paramReps;
  final Widget paramWeight;
  final Widget paramNotes;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool editView;
  final String buttonEditText;
  final String buttonDeleteText;

  const CardSmall({
    super.key,
    required this.title,
    required this.paramLiftingset,
    required this.paramReps,
    required this.paramWeight,
    required this.paramNotes,
    required this.buttonEditText,
    required this.buttonDeleteText,
    required this.onEdit,
    required this.onDelete,
    required this.editView,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: title, //Text('${liftingset.exercise}'),
            subtitle: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, // aligns the tile content to the left
              children: [paramLiftingset, paramReps, paramWeight, paramNotes],
            ),
          ),
          if (!editView)
          Padding(
            padding: EdgeInsets.all(Style.insetXS),
            child: Row(
              // aligns buttons horizontally
              mainAxisAlignment:
                  MainAxisAlignment.start, // aligns button to right of card
              children: [
                Padding(
                  padding: EdgeInsets.all(Style.insetXXXS), 
                  child: EditButton(onEdit: onEdit, buttonEditText: buttonEditText),
                ),
                Padding(
                  padding: EdgeInsets.all(Style.insetXXXS), 
                  child: DeleteButton(
                  onDelete: onDelete,
                  buttonDeleteText: buttonDeleteText,
                  ),
                ),              
              ],
            ),
            ),          
        ],
      ),
    );
  }
}
