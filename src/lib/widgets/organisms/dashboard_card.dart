import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/form_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../custom_styles.dart';

class DashboardCardWidget extends StatelessWidget {
  final dashboardCardController = Get.find<DashboardCardController>();
  final formController = Get.find<FormController>();
  RxList get liftingsets => formController.liftingsets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: Style.insetS, bottom: Style.insetXS),
          child: Text("Progress", style: TextStyle(fontSize: Style.fontH1)),
        ),
        Card(
          color: Style.colorFillPrimary,
          child: Padding(
            padding: EdgeInsets.all(Style.insetS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Overall Volume',
                        style: TextStyle(
                          fontSize: Style.fontTextL,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Style.insetS),
                        child: Obx(
                          () => Text(
                            '${dashboardCardController.volume.value}',
                            style: TextStyle(fontSize: Style.fontTextXL),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'info: We calculate the overall average volume based on all sets across all muscle groups.',
                  style: TextStyle(
                    fontSize: Style.label,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Style.colorFillPrimary,
          child: Padding(
            padding: EdgeInsets.all(Style.insetS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Style.insetXS),
                    child: Text(
                      'Volume by Muscle',
                      style: TextStyle(
                        fontSize: Style.fontTextL,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Style.insetS),
                  child: Column(
                    children: [
                      muscleVolumeRow('Compound', 'compound'),
                      muscleVolumeRow('Chest', 'chest'),
                      muscleVolumeRow('Back', 'back'),
                      muscleVolumeRow('Legs', 'legs'),
                      muscleVolumeRow('Arms', 'arms'),
                    ],
                  ),
                ),
                SizedBox(height: Style.insetS),
                Text(
                  'info: Average volume for each muscle group based on your tracked sets.',
                  style: TextStyle(
                    fontSize: Style.label,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget muscleVolumeRow(String label, String key) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(label, style: TextStyle(fontSize: Style.fontTextL)),
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => Text(
              '${dashboardCardController.volumeByExerciseType[key] ?? 0.0}',
              style: TextStyle(fontSize: Style.fontTextL),
            ),
          ),
        ),
      ],
    );
  }
}
