import 'package:flutter/material.dart';
import '../controllers/form_controller.dart';
import 'package:get/get.dart';
import '../custom_styles.dart';
import 'custom_card.dart';

class FormListWidgetSmall extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => formController.size == 0
          ? Text('No sets')
          : 
            ListView(
              scrollDirection: Axis.vertical,
                children: formController.liftingsets.reversed
                    .map(
                      (liftingset) => CardSmall(
                        editView: false,
                        title: Text('${liftingset.exercise}'), 
                        paramLiftingset: Text('Set: ${liftingset.liftingset}'), 
                        paramReps: Text('Reps: ${liftingset.reps}'), 
                        paramWeight: Text('Weight (kg): ${liftingset.weight}'), 
                        paramNotes: Text('Personal notes: ${liftingset.notes}'),
                        onEdit: () => Get.toNamed("/edit/${liftingset.id}"),  // Navigate to edit screen
                        onDelete: () { 
                          formController.delete(liftingset);  // Call delete function
                        },
                        ),
                        ).toList(),
                    ),
    );
  }
}

class FormListWidgetMedium extends StatelessWidget {
  final formController = Get.find<FormController>(); 

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => formController.size == 0
          ? Text('No sets')
          : ListView(
              scrollDirection: Axis.vertical,
                children: formController.liftingsets
                    .map(
                      (liftingset) => Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end, // aligned to end so that buttons end on same line as notes
                          children: [
                            Expanded(
                              flex: 7,
                              child: ListTile(
                              title: Text('${liftingset.exercise}'),
                              subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // aligns the tile content to the left
                              children: [
                                Text('Set: ${liftingset.liftingset}'),
                                Text('Reps: ${liftingset.reps}'),
                                Text('Weight (kg): ${liftingset.weight}'),
                                Text('Personal notes: ${liftingset.notes}'),
                                ],
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
                                        child: ElevatedButton(
                                          onPressed: () => Get.toNamed("/edit/${liftingset.id}"), 
                                          style: Style.secondaryButtonStyle,
                                          child: Text('Medium Edit ${liftingset.id}'),
                                      ), 
                                    ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: (){formController.delete(liftingset);}, 
                                          style: Style.secondaryButtonStyle,
                                          child: Text('Delete'),
                                      ),
                                      ),
                                    ],
                                  ),
                                  
                                  
                              ],
                              ),
                            ),
                            )
                            
                            
                          ],
                          ),
                          ),
                        ).toList(),
                    ),
    );
  }
}

class FormListWidgetLarge extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => formController.size == 0
          ? Text('No sets')
          : ListView(
              scrollDirection: Axis.vertical,
                children: formController.liftingsets
                    .map(
                      (liftingset) => Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end, // aligned to end so that buttons end on same line as notes
                          children: [
                            Expanded(
                              child: ListTile(
                              title: Text('${liftingset.exercise}'),
                              subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // aligns the tile content to the left
                              children: [
                                Text('Set: ${liftingset.liftingset}'),
                                Text('Reps: ${liftingset.reps}'),
                                Text('Weight (kg): ${liftingset.weight}'),
                                Text('Personal notes: ${liftingset.notes}'),
                                ],
                              ),
                            ),
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(onPressed: (){}, 
                                  style: Style.secondaryButtonStyle,
                                  child: Text('Edit')),
                                  TextButton(onPressed: (){}, 
                                  style: Style.secondaryButtonStyle,
                                  child: Text('Delete'))
                              ],
                            ),
                            
                          ],
                          ),
                          ),
                        ).toList(),
                    ),
    );
  }
}

/**Parking Lot
 * Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('${liftingset.exercise}'),
                              subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // aligns the tile content to the left
                              children: [
                                Text('Set: ${liftingset.liftingset}'),
                                Text('Reps: ${liftingset.reps}'),
                                Text('Weight (kg): ${liftingset.weight}'),
                                Text('Personal notes: ${liftingset.notes}'),
                                ],
                              ),
                            ),
                            Row( // aligns buttons horizontally
                              mainAxisAlignment: MainAxisAlignment.start, // aligns button to right of card
                              children: [
                                TextButton(onPressed: (){}, 
                                style: Style.secondaryButtonStyle,
                                child: Text('Edit')),
                                TextButton(onPressed: (){}, 
                                style: Style.secondaryButtonStyle,
                                child: Text('Delete'))
                            ],
                            ),
                          ],
                          ),
                          ),
 */