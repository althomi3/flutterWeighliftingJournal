import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form.dart';
import '../custom_styles.dart';

class CardSmall extends StatelessWidget{
  final Widget title;
  final Widget paramLiftingset;
  final Widget paramReps;
  final Widget paramWeight;
  final Widget paramNotes;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool editView;

  const CardSmall({
    super.key,
    required this.title,
    required this.paramLiftingset,
    required this.paramReps,
    required this.paramWeight,
    required this.paramNotes,
    this.onEdit,
    this.onDelete,
    this.editView=false,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: title,//Text('${liftingset.exercise}'),
                              subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // aligns the tile content to the left
                              children: [
                                paramLiftingset,
                                paramReps,
                                paramWeight,
                                paramNotes,
                                ],
                              ),
                            ),
                            if(!editView)
                            Row( // aligns buttons horizontally
                                mainAxisAlignment: MainAxisAlignment.start, // aligns button to right of card
                                children: [
                                  ElevatedButton(
                                    onPressed: onEdit, 
                                    style: Style.secondaryButtonStyle,
                                    child: Text('Mini Edit')),
                                  ElevatedButton(
                                    onPressed: onDelete, 
                                    style: Style.secondaryButtonStyle,
                                    child: Text('Mini Delete'))
                              ],
                              ),
                            
                          ],
                          ),
               );
  }
}