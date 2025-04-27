import 'package:flutter/material.dart';
import '../atoms/edit_button.dart';
import '../atoms/delete_button.dart';

class CardMedium extends StatelessWidget {
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

  CardMedium({
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
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment
                .end, // aligned to end so that buttons end on same line as notes
        children: [
          Expanded(
            flex: 7,
            child: ListTile(
              title: title,
              subtitle: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start, // aligns the tile content to the left
                children: [paramLiftingset, paramReps, paramWeight, paramNotes],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: EditButton(
                          onEdit: onEdit,
                          buttonEditText: buttonEditText,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DeleteButton(
                          onDelete: onDelete,
                          buttonDeleteText: buttonDeleteText
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
