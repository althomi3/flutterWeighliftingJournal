import 'package:flutter/material.dart';
import 'form.dart';
import 'package:get/get.dart';



class FormListWidgetSmall extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => formController.size == 0
          ? Text('No sets')
          : Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
                children: formController.liftingsets
                    .map(
                      (liftingset) => Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('${liftingset.exercise}'),
                              subtitle: Column(
                              children: [
                                Text('Set: ${liftingset.liftingset}'),
                                Text('Reps: ${liftingset.reps}'),
                                Text('Weight (kg): ${liftingset.weight}'),
                                Text('Personal notes: ${liftingset.notes}'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(onPressed: (){}, 
                                child: Text('Edit')),
                                TextButton(onPressed: (){}, 
                                child: Text('Delete'))
                            ],
                            ),
                          ],
                          ),
                          ),
                        ).toList(),
                    ),
              
      ),
    );
  }
}