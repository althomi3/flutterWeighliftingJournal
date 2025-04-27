import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:src/custom_styles.dart';
import '../atoms/add_elevated_button.dart';
import '../../models/models.dart';
import '../../controllers/form_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/navigation_controller.dart';

class FormWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final formController =Get.find<FormController>(); // initializes FormController
  final dashboardCardController =Get.find<DashboardCardController>(); // initializes DashboardController which contains function to calculate statistics
  final navigationController = Get.find<NavigationController>(); // needed to update the selectedIndex when user gets navigated to ViewScreen after submit. otherwise, tab in navbar does not update accordingly

  bool isEditScreen; // sets bool var which is later used to control different content in the form depending on whether the user is in EditScreen or ViewScreen
  final LiftingSet?
  liftingsetToEdit; // initializes data set, used to retrieve specific data set in EditScreen vs list of entries in ViewScreen
  RxList get liftingsets =>formController.liftingsets; // getter gets RxList liftingsets

  FormWidget({
    super.key,
    required this.isEditScreen,
    required this.liftingsetToEdit,
  });

  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      // Create a new LiftingSet with form values
      LiftingSet liftingset = LiftingSet(
        liftingsetToEdit?.id ?? formController.counter.toString(),
        _formKey.currentState!.value['exercise'] ?? "No exercise specified",
        _formKey.currentState!.value['set'] ?? "0",
        _formKey.currentState!.value['reps'] ?? "0",
        _formKey.currentState!.value['weight'] ?? "No weight specified",
        _formKey.currentState!.value['notes'] ?? "None for this set",
      );

      if (isEditScreen && liftingsetToEdit != null) {
        // Update the existing LiftingSet if we're on EditScreen
        formController.updateLiftedSet(liftingset);
        // Go back to the previous screen
      } else {
        // If not in EditScreen, add a new LiftingSet
        formController.add(liftingset);
      }

      _formKey.currentState?.reset(); // Reset the form after submission

      // update volume calculation on each new form entry
      dashboardCardController.calculateVolume(
        liftingsets,
      ); // statistics are updated as soon as a new entry is added
      dashboardCardController.calculateVolume(liftingsets);
      dashboardCardController.calculateVolumeForExercise(
        liftingsets,
        'compound',
      );
      dashboardCardController.calculateVolumeForExercise(liftingsets, 'chest');
      dashboardCardController.calculateVolumeForExercise(liftingsets, 'leg');
      dashboardCardController.calculateVolumeForExercise(liftingsets, 'back');
      dashboardCardController.calculateVolumeForExercise(liftingsets, 'arms');

      navigationController.selectedIndex.value = 1; // updates the index so that navigation bar highlights correct tab
      Get.toNamed('/all');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(bottom: Style.insetL),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Style.insetXXXS),
              child: FormBuilderDropdown(
                name: "exercise",
                items: const [
                  DropdownMenuItem(value: 'compound', child: Text('Compound')),
                  DropdownMenuItem(value: 'chest', child: Text('Chest')),
                  DropdownMenuItem(value: 'back', child: Text('Back')),
                  DropdownMenuItem(value: 'leg', child: Text('Leg')),
                  DropdownMenuItem(value: 'arms', child: Text('Arms')),
                ],
                hint: Text('Muscle Group'),

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Which muscles does your exercise mainly target?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Style.insetXXXS),
              child: FormBuilderDropdown(
                name: "set",
                items: const [
                  DropdownMenuItem(value: "1", child: Text('1')),
                  DropdownMenuItem(value: "2", child: Text('2')),
                  DropdownMenuItem(value: "3", child: Text('3')),
                  DropdownMenuItem(value: "4", child: Text('4')),
                  DropdownMenuItem(value: "5", child: Text('5')),
                ],
                hint: Text('Set'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Which set are your on?',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(Style.insetXXXS),
              child: FormBuilderDropdown(
                name: "reps",
                items: const [
                  DropdownMenuItem(value: "1", child: Text('1')),
                  DropdownMenuItem(value: "2", child: Text('2')),
                  DropdownMenuItem(value: "3", child: Text('3')),
                  DropdownMenuItem(value: "4", child: Text('4')),
                  DropdownMenuItem(value: "5", child: Text('5')),
                  DropdownMenuItem(value: "6", child: Text('6')),
                  DropdownMenuItem(value: "7", child: Text('7')),
                  DropdownMenuItem(value: "8", child: Text('8')),
                  DropdownMenuItem(value: "9", child: Text('9')),
                  DropdownMenuItem(value: "10", child: Text('10')),
                  DropdownMenuItem(value: "11", child: Text('11')),
                  DropdownMenuItem(value: "12", child: Text('12')),
                  DropdownMenuItem(value: "13", child: Text('13')),
                  DropdownMenuItem(value: "14", child: Text('14')),
                  DropdownMenuItem(value: "15", child: Text('15')),
                ],
                hint: Text('Reps'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'How many reps did you do in this set?',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Style.insetXXXS),
              child: FormBuilderTextField(
                name: 'weight',
                decoration: InputDecoration(
                  hintText: 'Weight (kg), e.g., 3.25',
                  border: OutlineInputBorder(),
                  helperText:
                      'How much weight did you use in this set, e.g., 3.25?',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(Style.insetXXXS),
              child: FormBuilderTextField(
                name: 'notes',
                decoration: InputDecoration(
                  hintText: 'Personal notes',
                  border: OutlineInputBorder(),
                  helperText: 'How did your set go?',
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(Style.insetS),
              child: SizedBox(
                width: Style.widthButtonMedium,
                child: CustomElevatedButton(
                  onSubmit: _submit,
                  content:
                      isEditScreen
                          ? Text(
                            'Update Set',
                            style: TextStyle(color: Style.fontColorLight),
                          )
                          : Text(
                            'Submit Set',
                            style: TextStyle(color: Style.fontColorLight),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
