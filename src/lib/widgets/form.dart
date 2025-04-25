import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'add_elevated_button.dart';
import '../models/models.dart';
import '../controllers/form_controller.dart';
import '../controllers/dashboard_controller.dart';


class FormWidget extends StatelessWidget {
  final  _formKey = GlobalKey<FormBuilderState>();
  final formController = Get.find<FormController>(); // initializes FormController
  final dashboardCardController = Get.find<DashboardCardController>(); // initializes DashboardController which contains function to calculate statistics
  bool isEditScreen; // sets bool var which is later used to control different content in the form depending on whether the user is in EditScreen or ViewScreen
  final LiftingSet? liftingsetToEdit; // initializes data set, used to retrieve specific data set in EditScreen vs list of entries in ViewScreen
  RxList get liftingsets => formController.liftingsets; // getter gets RxList liftingsets

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
    dashboardCardController.calculateVolume(liftingsets); // statistics are updated as soon as a new entry is added
    dashboardCardController.calculateVolume(liftingsets);
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'compound');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'chest');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'leg');
    dashboardCardController.calculateVolumeForExercise(liftingsets, 'back');
    
    Get.toNamed('/all');
  }
}



  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderDropdown(
            name: "exercise", 
            items: const [
                  DropdownMenuItem(value: 'compound', child: Text('Compound')),
                  DropdownMenuItem(value: 'chest', child: Text('Chest')),
                  DropdownMenuItem(value: 'back', child: Text('Back')),
                  DropdownMenuItem(value: 'leg', child: Text('Leg')),
                ],
            hint: Text('Select your muscle group'),
            decoration: InputDecoration(
              labelText: 'Muscle Group',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderDropdown(
            name: "set", 
            items: const [
                  DropdownMenuItem(value: "1", child: Text('1')),
                ],
            hint: Text('Select current set'),
            decoration: InputDecoration(
              labelText: 'Set',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderDropdown(
            name: "reps", 
            items: const [
                  DropdownMenuItem(value: "1", child: Text('1')),
                ],
            hint: Text('Select current set'),
            decoration: InputDecoration(
              labelText: 'Reps',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderTextField(
            name: 'weight',
            decoration: InputDecoration(
              labelText: 'Weight',
              hintText: 'Enter your weight in kg, e.g., 3',
              border: OutlineInputBorder(),
            ),
          ),

          FormBuilderTextField(
            name: 'notes',
            decoration: InputDecoration(
              labelText: 'Personal notes',
              hintText: 'How was your set? Enter personal training notes.',
              border: OutlineInputBorder(),
            ),
          ),
          
          CustomElevatedButton(
            onSubmit: _submit, 
            content: isEditScreen ? Text('Update Set') : Text('Submit Set'),
          ),
          /*CustomElevatedButton(
            onPressed: _submit,
            child: Text('Submit Set'),
          )*/

        ],
      ),
    );
  }
}

