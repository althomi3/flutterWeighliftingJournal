import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../custom_styles.dart';




class DashboardCardWidget extends StatelessWidget{
  final dashboardCardController= Get.find<DashboardCardController>(); // instantiates DashboardCardController
  final formController = Get.find<FormController>();
  RxList get liftingsets => formController.liftingsets; // getter gets RxList liftingsets


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                  padding: EdgeInsets.only(top: Style.insetS),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[Text("Progress", style: TextStyle(fontSize: Style.fontH1),),] 
                  ),
          ),
          IntrinsicHeight( // forces children to expand to same height of tallest child
          child: Row(
            children: [
            Expanded(
              child: Card(
              color: Style.colorFillPrimary,
              child: Padding(
                    padding: Style.contentMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Average Volume', style: TextStyle(fontSize: Style.fontTextM, fontWeight: FontWeight.bold),),
                  Obx(()=>Text('Average Volume: ${dashboardCardController.volume.value}')), // reactive text which updates as soon as user 
                  Text('Info text about volumne'),
                  ],
                ),
              ),
            ),  
            ),
          Expanded(
            child: 
            Card(
              color: Style.colorFillPrimary,
              child: Padding(
                    padding: Style.contentMargin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Average Volume by Muscle Group', style: TextStyle(fontSize: Style.fontTextM, fontWeight: FontWeight.bold),),
                        /**buttons for debugging if auto-update of volumes does not work */
                        // ElevatedButton(onPressed: () => dashboardCardController.calculateVolumeForExercise(liftingsets, 'chest'), child: Text("calc chest"),),
                        // ElevatedButton(onPressed: () => dashboardCardController.calculateVolumeForExercise(liftingsets, 'compound'), child: Text("calc compound"),),
                        Obx(()=>Text('Average Volume: ${dashboardCardController.volume.value}')), // reactive text which updates as soon as user 
                        Obx(()=>Text('Average Volume Chest: ${dashboardCardController.volumeByExerciseType['chest']}')), // reactive text which updates as soon as user 
                        Obx(()=>Text('Average Volume Compound: ${dashboardCardController.volumeByExerciseType['compound']}')), // reactive text which updates as soon as user 
                        Obx(()=>Text('Average Volume Back: ${dashboardCardController.volumeByExerciseType['back']}')), // reactive text which updates as soon as user
                        Obx(()=>Text('Average Volume Leg: ${dashboardCardController.volumeByExerciseType['leg']}')), // reactive text which updates as soon as user 
                        // adds new form entry
                        Text('Info text about volumne'),
                        ],
                      ),
                ),
          ),
          ),
          

            ],
          ),
          ),
          
      ],      
    );
  }
}