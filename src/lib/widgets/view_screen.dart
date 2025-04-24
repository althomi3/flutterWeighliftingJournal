import 'package:flutter/material.dart';
import 'layout.dart';
import 'add_elevated_button.dart';
import 'form.dart';
import 'package:get/get.dart';



class FormListWidget extends StatelessWidget {
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

class ViewScreen extends StatelessWidget {

  const ViewScreen({
    super.key,
    }); // sets key for public class HomeScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
            body: Center(
              child: Column(children: [
                Text('ViewScreen'),
                FormListWidget(),
                CustomElevatedButton(icon: Icon(Icons.add)),
              ],
              ),
            ),
          ),
        );
  }
}