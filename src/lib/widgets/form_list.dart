import 'package:flutter/material.dart';
import 'form.dart';
import 'package:get/get.dart';
import '../custom_styles.dart';

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
                children: formController.liftingsets
                    .map(
                      (liftingset) => Card(
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
                                          onPressed: (){}, 
                                          style: Style.secondaryButtonStyle,
                                          child: Text('Medium Edit'),
                                      ), 
                                    ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: (){}, 
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