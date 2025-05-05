import 'package:flutter/material.dart';
import 'molecules/custom_card_large.dart';
import 'molecules/custom_card_medium.dart';
import '../controllers/form_controller.dart';
import 'package:get/get.dart';
import '../custom_styles.dart';
import 'molecules/custom_card_small.dart';
import 'molecules/empty_state.dart';

class FormListWidgetSmall extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          formController.size == 0
              ? EmptyStateWidget() // custom widget that supports user to start tracking
              : ListView(
                scrollDirection: Axis.vertical,
                children:
                    formController.liftingsets.reversed
                        .map(
                          (liftingset) => CardSmall(
                            editView: false,
                            title: Text('${liftingset.exercise}'),
                            paramLiftingset: Text(
                              'Set: ${liftingset.liftingset}',
                            ),
                            paramReps: Text('Reps: ${liftingset.reps}'),
                            paramWeight: Text(
                              'Weight (kg): ${liftingset.weight}',
                            ),
                            paramNotes: Text(
                              'Personal notes: ${liftingset.notes}',
                            ),
                            onEdit:
                                () => Get.toNamed(
                                  "/edit/${liftingset.id}",
                                  arguments: liftingset,
                                ), // Navigate to edit screen
                            onDelete: () {
                              formController.delete(
                                liftingset,
                              ); // Call delete function
                            },
                            buttonDeleteText: "Delete",
                            buttonEditText: "Edit",
                          ),
                        )
                        .toList(),
              ),
    );
  }
}

class FormListWidgetMedium extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          formController.size == 0
              ? EmptyStateWidget() // custom widget that supports user to start tracking
              : ListView(
                scrollDirection: Axis.vertical,
                children:
                    formController.liftingsets
                        .map(
                          (liftingset) => CardMedium(
                            editView: false,
                            title: Text('${liftingset.exercise}'),
                            paramLiftingset: Text(
                              'Set: ${liftingset.liftingset}',
                            ),
                            paramReps: Text('Reps: ${liftingset.reps}'),
                            paramWeight: Text(
                              'Weight (kg): ${liftingset.weight}',
                            ),
                            paramNotes: Text(
                              'Personal notes: ${liftingset.notes}',
                            ),
                            onEdit:
                                () => Get.toNamed(
                                  "/edit/${liftingset.id}",
                                  arguments: liftingset,
                                ), // Navigate to edit screen
                            onDelete: () {
                              formController.delete(
                                liftingset,
                              ); // Call delete function
                            },
                            buttonDeleteText: "Delete",
                            buttonEditText: "Edit",
                          ),
                        )
                        .toList(),
              ),
    );
  }
}

class FormListWidgetLarge extends StatelessWidget {
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          formController.size == 0
              ? EmptyStateWidget() // custom widget that supports user to start tracking
              : ListView(
                scrollDirection: Axis.vertical,
                children:
                    formController.liftingsets
                        .map(
                          (liftingset) => CardLarge(
                            editView: false,
                            title: Text('${liftingset.exercise}'),
                            paramLiftingset: Text(
                              'Set: ${liftingset.liftingset}',
                            ),
                            paramReps: Text('Reps: ${liftingset.reps}'),
                            paramWeight: Text(
                              'Weight (kg): ${liftingset.weight}',
                            ),
                            paramNotes: Text(
                              'Personal notes: ${liftingset.notes}',
                            ),
                            onEdit:
                                () => Get.toNamed(
                                  "/edit/${liftingset.id}",
                                  arguments: liftingset,
                                ), // Navigate to edit screen
                            onDelete: () {
                              formController.delete(
                                liftingset,
                              ); // Call delete function
                            },
                            buttonDeleteText: "Delete",
                            buttonEditText: "Edit",
                          ),
                        )
                        .toList(),
              ),
    );
  }
}
