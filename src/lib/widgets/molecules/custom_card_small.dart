import 'package:flutter/material.dart';
import '../atoms/edit_button.dart';
import '../atoms/delete_button.dart';
import '../../models/models.dart';



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

  CardSmall({
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
            Row(
              // aligns buttons horizontally
              mainAxisAlignment:
                  MainAxisAlignment.start, // aligns button to right of card
              children: [
                EditButton(
                  onEdit: onEdit, 
                  buttonEditText: buttonEditText),
                DeleteButton(
                  onDelete: onDelete, 
                  buttonDeleteText: buttonDeleteText)
              ],
            ),
        ],
      ),
    );
  }
}
