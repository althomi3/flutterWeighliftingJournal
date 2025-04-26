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
                  padding: EdgeInsets.only(top: Style.insetS, bottom: Style.insetS),
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
                  Align( // aligns card title and main content center while it keeps the info text left-aligned
                    alignment: Alignment.center,
                    child: Column(
                        children: [Text('Overall Volume', style: TextStyle(fontSize: Style.fontTextM, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.all(Style.insetS),
                          child: Obx(()=>Text('${dashboardCardController.volume.value}', style: TextStyle(fontSize: Style.fontTextXL))), // reactive text which updates as soon as user 
                        ),
                        ],
                    ),
                  ), 
                  Text('info: We calculate the overall average volume as based on all sets across all muscle groups.', style: TextStyle(fontSize: Style.label, fontStyle: FontStyle.italic),
                  ),
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
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: Style.insetXS),
                            child: 
                            Text(
                                'Volume by Muscle',
                                style: TextStyle(fontSize: Style.fontTextM, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: Style.insetXS, left: Style.insetXL, right: Style.insetXL), 
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row( // following logic ensures a structured presentation of the exercise statistics in a table-like format
                                  children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text('Compound:', style: TextStyle(fontSize: Style.fontTextL)),
                                    ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(()=>Text('${dashboardCardController.volumeByExerciseType['compound']}', style: TextStyle(fontSize: Style.fontTextL))),
                                    ), // reactive text which updates as soon as user ),
                                  ],
                                ),
                                Row(
                                  children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text('Chest:', style: TextStyle(fontSize: Style.fontTextL)),
                                    ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(()=>Text('${dashboardCardController.volumeByExerciseType['chest']}', style: TextStyle(fontSize: Style.fontTextL))),
                                    ), // reactive text which updates as soon as user ),
                                  ],
                                ),
                                Row(
                                  children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text('Back:', style: TextStyle(fontSize: Style.fontTextL)),
                                    ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(()=>Text('${dashboardCardController.volumeByExerciseType['back']}', style: TextStyle(fontSize: Style.fontTextL))),
                                    ), // reactive text which updates as soon as user ),
                                  ],
                                ),
                                Row(
                                  children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text('Legs:', style: TextStyle(fontSize: Style.fontTextL)),
                                    ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(()=>Text('${dashboardCardController.volumeByExerciseType['leg']}', style: TextStyle(fontSize: Style.fontTextL))),
                                    ), // reactive text which updates as soon as user ),
                                  ],
                                ),                               
                                /**buttons for debugging if auto-update of volumes does not work */
                              // ElevatedButton(onPressed: () => dashboardCardController.calculateVolumeForExercise(liftingsets, 'chest'), child: Text("calc chest"),),
                              // ElevatedButton(onPressed: () => dashboardCardController.calculateVolumeForExercise(liftingsets, 'compound'), child: Text("calc compound"),),
                              ],
                            ),
                            ), 
                        Text('info: We calculate the average volume for each muscle group based on all sets you tracked per muscle group.', style: TextStyle(fontSize: Style.label, fontStyle: FontStyle.italic),),
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