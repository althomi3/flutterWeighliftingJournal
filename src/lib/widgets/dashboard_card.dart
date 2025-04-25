import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';
import '../controllers/dashboard_controller.dart';



class DashboardCardWidget extends StatelessWidget{
  final dashboardCardController= Get.find<DashboardCardController>(); // instantiates DashboardCardController
  final formController = Get.find<FormController>();
  RxList get liftingsets => formController.liftingsets; // getter gets RxList liftingsets


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            Text('Average Volume'),
            Text('Info text about volumne'),
            /**buttons for debugging if auto-update of volumes does not work */
            ElevatedButton(onPressed: () => dashboardCardController.calculateVolumeForExercise(liftingsets, 'chest'), child: Text("calc chest"),),
            ElevatedButton(onPressed: () => dashboardCardController.calculateVolumeForExercise(liftingsets, 'compound'), child: Text("calc compound"),),
            Obx(()=>Text('Average Volume: ${dashboardCardController.volume.value}')), // reactive text which updates as soon as user 
            Obx(()=>Text('Average Volume Chest: ${dashboardCardController.volumeByExerciseType['chest']}')), // reactive text which updates as soon as user 
            Obx(()=>Text('Average Volume Compound: ${dashboardCardController.volumeByExerciseType['compound']}')), // reactive text which updates as soon as user 
            Obx(()=>Text('Average Volume Back: ${dashboardCardController.volumeByExerciseType['back']}')), // reactive text which updates as soon as user
            Obx(()=>Text('Average Volume Leg: ${dashboardCardController.volumeByExerciseType['leg']}')), // reactive text which updates as soon as user 


            // adds new form entry
            ],
          ),
    );
  }
}